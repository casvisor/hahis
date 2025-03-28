package com.hospital.mapper;

import com.hospital.entity.Menu;
import com.hospital.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    User  loginname(String loginname);

    //查询所有菜单
    List<Menu> queryMenuByUid(Integer userid);
    List<Menu> loadAvailableMenu();

    List<Menu> selAllMenuByUser(Integer userId);

    //查询所有菜单   模糊查询
    List<Menu> queryMenuAllList(Menu menu);

    //添加菜单
     int addMenu(Menu menu);

    //删除菜单
    int deleteMenu(Integer id);

    //检查父级中是否有子级菜单
    int checkMenuHasChildren(Integer pid);

    //修改
    int updateMenu(Menu menu);

    List<Menu> queryMenuByRoleId(Integer roleid);
}
