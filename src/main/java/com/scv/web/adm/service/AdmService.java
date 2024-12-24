package com.scv.web.adm.service;

import com.scv.web.adm.domain.AdmVO;

public interface AdmService {

    AdmVO login(AdmVO admVO)throws Exception;
}
