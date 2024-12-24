package com.scv.web.adm.persistence;

import com.scv.web.adm.domain.AdmVO;

public interface AdmDAO {
    AdmVO login(AdmVO admVO) throws Exception;
}
