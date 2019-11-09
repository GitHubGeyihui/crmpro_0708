package com.ujiuye.cus.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.bean.CustomerVo;
import com.ujiuye.cus.service.CustomerService;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.attribute.standard.MediaSize;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cus")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("showInfo")
    public String shoeInfo(Integer status, @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, ModelMap modelMap, CustomerVo customerVo, HttpSession session) {
        if (customerVo.getKeyCode().length() > 0 || status != null) {
            session.removeAttribute("customerVo");
        }
        List<Customer> list = null;
        //分页查询 使用mybatis 提供的分页插件进行分页处理
        PageHelper.startPage(pageNum, 3);
        CustomerVo vo = (CustomerVo) session.getAttribute("customerVo");
        if (vo != null) {
            list = customerService.showInfo(vo);
        } else {
            list = customerService.showInfo(customerVo);
            session.setAttribute("customerVo", customerVo);
        }
        PageInfo pageInfo = new PageInfo(list);
        session.setAttribute("list", pageInfo.getList());
        modelMap.addAttribute("customers", pageInfo);
        return "customer";
    }


    @RequestMapping("batchDelete")
    public String batchDelete(Integer[] cid) {
        boolean flag = customerService.batchDelete(cid);
        if (flag) {
            return "redirect:showInfo";
        } else {
            return "error";
        }
    }

    //根据id获取一个客户信息对象
    @RequestMapping("getOneByPk")
    @ResponseBody
    public Customer getOneByPk(Integer pk) {
        return customerService.getOneByPk(pk);
    }

    //更新数据
    @RequestMapping("updateCus")

    public String updateCus(Customer customer) {
        System.out.println("====" + new java.util.Date());
        customer.setAddtime(new java.util.Date());
        boolean flag = customerService.updateCus(customer);
        if (flag) {
            return "redirect:showInfo";
        } else {
            return "error";
        }
    }

    //完成导出Excel操作
    @RequestMapping("OutExcel")
    public String OutExcel(HttpSession session) {
        /*
        *   HSSFWorkbook excel文档对象
            HSSFSheet excel的sheet
            HSSFRow excel的行
            HSSFCell excel的单元格
        * */
        //表格数据
        List<Customer> list = (List<Customer>) session.getAttribute("list");
        //输出方式  new OutputStream（java中的io输出） response.getXXXX(浏览器响应内容)
        try {
            FileOutputStream fos = new FileOutputStream("D:\\Desktop\\客户信息.xls");
            //excle文档对象
            HSSFWorkbook workbook = new HSSFWorkbook();
            //excle中的一个sheet
            HSSFSheet sheet = workbook.createSheet("客户信息");
            //创建当前页的第一行 HSSFRow
            HSSFRow row = sheet.createRow(0);
            //创建当前页的第一个单元格 HSSFCell
            HSSFCell cell = row.createCell(0);
            cell.setCellValue("编号");

            HSSFCell cell2 = row.createCell(1);
            cell2.setCellValue("公司名称");

            HSSFCell cell3 = row.createCell(2);
            cell3.setCellValue("联系人名称");

            HSSFCell cell4 = row.createCell(3);
            cell4.setCellValue("备注");

            HSSFCell cell5 = row.createCell(4);
            cell5.setCellValue("联系方式");

            for (int i = 0; i < list.size(); i++) {
                Customer customer = list.get(i);
                //新的一句话
                HSSFRow row1 = sheet.createRow(i + 1);
                HSSFCell ncell = row1.createCell(0);
                ncell.setCellValue(customer.getId());

                HSSFCell ncell2 = row1.createCell(1);
                ncell2.setCellValue(customer.getComname());

                HSSFCell ncell3 = row1.createCell(2);
                ncell3.setCellValue(customer.getCompanyperson());

                HSSFCell ncell4 = row1.createCell(3);
                ncell4.setCellValue(customer.getRemark());

                HSSFCell ncell5 = row1.createCell(4);
                ncell5.setCellValue(customer.getComphone());
            }

            //将我们的文档输出到指定位置
            workbook.write(fos);
            fos.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:showInfo";
    }

    //layui 组件测试 使用customer 数据
    @RequestMapping("layuishowInfo")
    @ResponseBody
    public Map<String, Object> layuishowInfo(Integer limit, Integer page) {
        System.out.println(limit + "==========" + page);
        List<Customer> list = customerService.showInfo(null);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", list);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 1000);
        return map;

    }
}
