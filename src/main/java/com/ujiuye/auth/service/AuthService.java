package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.Sources;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface AuthService {
    Sources showAllSources();

    boolean addSources(Sources sources);

    boolean deleteSources(Integer id);

    Sources getOneSourceById(Integer id);

    List<Role> getAllRole(MarkInfo markInfo);

    boolean deleteRole(Integer roleid);

    boolean addRole(Role role, String sourcesid);

    Role getOneRole(Integer roleid);

    Sources getInfoByRoleId(Integer roleid);
}
