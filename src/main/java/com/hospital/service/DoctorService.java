package com.hospital.service;

import com.hospital.entity.Departments;
import com.hospital.entity.Doctor;
import com.hospital.entity.Registeredtype;

import java.util.List;

public interface DoctorService {
    /*
     * 医生的增删改查
     * */
    List<Doctor> doctorList(Doctor doctor);
    int deleteDoctor(Integer doctorId);
    int addDoctor(Doctor doctor);
    int editDoctor(Doctor doctor);
    List<Departments> findAllDepartments();
    List<Registeredtype>findAllRegisteredtype();
    int count(Doctor doctor);
    /*
     * 判断该医生是否还有病人
     * */
    int checkCount(Integer doctorId);
}
