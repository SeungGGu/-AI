package com.scv.web.adm.service;

import com.scv.web.adm.domain.AdmVO;
import com.scv.web.adm.persistence.AdmDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class AdmServiceImpl implements AdmService{

    private final AdmDAO admDAO;

    @Inject
    public AdmServiceImpl(AdmDAO admDAO){
        this.admDAO = admDAO;
    }

    @Override
    public AdmVO login(AdmVO admVO)throws Exception {
        return admDAO.login(admVO);
    }
}
