package com.hospital.mapper;

import com.hospital.entity.Ban;
import com.hospital.entity.Paiban;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaibanMapper {
    List<Paiban> findAllPaiban(Paiban paiban);
    int editPaiban(Paiban paiban);
    List<Ban> findAllBan();
    int insertPaiban(Paiban paiban);
    int count(Integer Id);
}
