package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.RoleSources;
import com.ujiuye.auth.bean.Sources;
import com.ujiuye.auth.mapper.EmpRoleMapper;
import com.ujiuye.auth.mapper.RoleMapper;
import com.ujiuye.auth.mapper.RoleSourcesMapper;
import com.ujiuye.auth.mapper.SourcesMapper;
import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.mapper.EmployeeMapper;
import com.ujiuye.util.MarkInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class AuthServiceImpl implements AuthService {
    @Resource
    private SourcesMapper sourcesMapper;
    @Resource
    private AuthService authService;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleSourcesMapper roleSourcesMapper;
    @Resource
    private EmployeeMapper employeeMapper;
    @Resource
    private EmpRoleMapper empRoleMapper;

    @Override
    public Sources showAllSources() {
        // 第一步 获取我们的根元素
        Sources rootSources = sourcesMapper.getRootSources();
        //设定当前根节点下的子节点是打开状态
        rootSources.setOpen(true);
        //根节点的子节点
        getChild(rootSources);
        return rootSources;
    }

    //递归方法
    public void getChild(Sources sources) {
        List<Sources> child = sourcesMapper.getNextSources(sources.getId());
        if (child.size() > 0) {
            sources.setChildren(child);
            for (Sources sources1 : child) {
                getChild(sources1);
            }
        }
    }

    //添加节点
    @Override
    public boolean addSources(Sources sources) {
        if (sources.getId() != null) {
            return sourcesMapper.updateByPrimaryKeySelective(sources) > 0;
        } else {
            return sourcesMapper.insert(sources) > 0;
        }
    }

    //删除节点
    @Override
    public boolean deleteSources(Integer id) {
        return sourcesMapper.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public Sources getOneSourceById(Integer id) {
        return sourcesMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> getAllRole(MarkInfo markInfo) {
        return roleMapper.getAllRole(markInfo);
    }

    //级联查询删除角色
    @Override
    @Transactional
    public boolean deleteRole(Integer roleid) {
        boolean flag1 = roleSourcesMapper.deleteByRoleId(roleid) > 0;
        boolean flag2 = empRoleMapper.deleteByRoleId(roleid) > 0;
        //最后删除角色表中的内容
        boolean flag = roleMapper.deleteByPrimaryKey(roleid) > 0;

        return true;
    }

    @Override
    @Transactional
    public boolean addRole(Role role, String sourcesid) {
        /*
         * 1：现在role添加一条角色数据
         * 2：角色和资源表中添加一些关联信息
         * */
        //向角色表中添加一个数据
        if (role.getRoleid() != null) {
            roleSourcesMapper.batchDeleteInfo(role.getRoleid());
            roleMapper.updateByPrimaryKeySelective(role);
            //删除我们role_sources中当前角色对应的资源信息
        } else {
            roleMapper.insert(role);
        }
        String[] split = sourcesid.split(",");//split分串
        List<RoleSources> list = new ArrayList<RoleSources>();
        for (int i = 0; i < split.length; i++) {
            RoleSources rs = new RoleSources();
            rs.setRoleid(role.getRoleid());
            rs.setSid(Integer.parseInt(split[i]));
            rs.setRsdis(role.getRolename() + "有" + Integer.parseInt(split[i]) + "权限");
            list.add(rs);
        }
        //批量插入数据
        roleSourcesMapper.batchAddInfo(list);
        return false;
    }

    @Override
    public Role getOneRole(Integer roleid) {
        Role role = roleMapper.selectByPrimaryKey(roleid);
        // 获取所有的当前角色对应的资源的对象数据(除去 pid is null)
        List<Sources> sourceByRoleid = sourcesMapper.getSourceByRoleid(roleid);
        role.setSourcesList(sourceByRoleid);
        return role;
    }

    //根据角色id,递归出我们角色的层级资源
    @Override
    public Sources getInfoByRoleId(Integer roleid) {
        // 第一步 获取我们的根元素
        Sources rootSources = sourcesMapper.getRootSources();
        rootSources.setOpen(true);
        getChildByRoleid(rootSources, roleid);
        return rootSources;
    }

    //递归方法
    public void getChildByRoleid(Sources sources, Integer roleid) {
        List<Sources> child = sourcesMapper.getChildren(roleid, sources.getId());
        if (child.size() > 0) {
            sources.setChildren(child);
            for (Sources sources1 : child) {
                getChildByRoleid(sources1, roleid);
            }
        }
    }

}
