package com.hospital.mapper;

import com.hospital.entity.Register;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LleaveMapper {

    List<Register> selRegisters(Register register);
    int updRstate(Register register);
    int updBstate(Register register);
    int selYaos(Register register);

}
