package com.hospital.service.Impl;

import com.hospital.entity.Baoque;
import com.hospital.entity.Drugstore;
import com.hospital.entity.Ypharmacy;
import com.hospital.mapper.OutinstoreMapper;
import com.hospital.service.OutinstoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class OutinstoreServiceImpl implements OutinstoreService {
    @Resource
    private OutinstoreMapper om;
    @Override
    public List<Baoque> selbaoquedan(Baoque baoque) {
        return om.selbaoquedan(baoque);
    }

    @Override
    public List<Drugstore> selbaoquedrugname(Drugstore drugstore) {
        return om.selbaoquedrugname(drugstore);
    }

    @Override
    public int updatedrugnumber(Drugstore drugstore) {
        return om.updatedrugnumber(drugstore);
    }

    @Override
    public int upbaoquenumber(Drugstore drugstore) {
        return om.upbaoquenumber(drugstore);
    }

    @Override
    public int uppharmacynumber(Drugstore drugstore) {
        return om.uppharmacynumber(drugstore);
    }

    @Override
    public int seldrugnamenum(Drugstore drugstore) {
        return om.seldrugnamenum(drugstore);
    }

    @Override
    public int deldrugnamenum(Drugstore drugstore) {
        return om.deldrugnamenum(drugstore);
    }

    @Override
    public int selbaoquenamenum(Drugstore drugstore) {
        return om.selbaoquenamenum(drugstore) ;
    }

    @Override
    public int delbaoquenamenum() {
        return om.delbaoquenamenum();
    }

    @Override
    public int addpharmacy(Ypharmacy ypharmacy) {
        return om.addpharmacy(ypharmacy);
    }

    @Override
    public int selpharymacyname(Ypharmacy ypharmacy) {
        return om.selpharymacyname(ypharmacy);
    }

    @Override
    public int uppharymacy(Ypharmacy ypharmacy) {
        return om.uppharymacy(ypharmacy);
    }

    @Override
    public int selbaoquecount() {
        return om.selbaoquecount();
    }

    @Override
    public int selbaoqueName(Ypharmacy ypharmacy) {
        return om.selbaoqueName(ypharmacy);
    }

    @Override
    public int upbaoquenumber1(Ypharmacy ypharmacy) {
        return om.upbaoquenumber1(ypharmacy);
    }



}
