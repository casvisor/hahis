package com.hospital.service;

import com.hospital.entity.ReportVo;

import java.util.List;

public interface CTakeService {
    //查询挂号的所有信息用于页面表格展示
    List<ReportVo> sel();
    //药品出库修改用户状态
    Integer chuku(ReportVo reportVo);
    //查看所有交过费出院的患者
    List<ReportVo> selhuan(ReportVo reportVo);
    //查询该用户的总价钱
    int zong(Integer reid);
}
