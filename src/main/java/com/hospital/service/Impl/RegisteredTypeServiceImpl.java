package com.hospital.service.Impl;

import com.hospital.entity.Registeredtype;
import com.hospital.mapper.RegisteredTypeMapper;
import com.hospital.service.RegisteredTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class RegisteredTypeServiceImpl implements RegisteredTypeService {
    @Resource
    private RegisteredTypeMapper registeredTypeMapper;
    @Override
    public List<Registeredtype> registeredTypeList(Registeredtype registeredType) {
        return registeredTypeMapper.registeredTypeList(registeredType);
    }

    @Override
    public int deleteType(Integer registeredId) {
        return registeredTypeMapper.deleteType(registeredId);
    }

    @Override
    public int editRegisteredType(Registeredtype registeredType) {
        return registeredTypeMapper.editRegisteredType(registeredType);
    }

    @Override
    public int addRegisteredType(Registeredtype registeredType) {
        return registeredTypeMapper.addRegisteredType(registeredType);
    }

    @Override
    public int count(Registeredtype registeredType) {
        return registeredTypeMapper.count(registeredType);
    }
}
