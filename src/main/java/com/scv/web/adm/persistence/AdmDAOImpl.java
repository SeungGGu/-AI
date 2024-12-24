package com.scv.web.adm.persistence;

import com.scv.web.adm.domain.AdmVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class AdmDAOImpl implements AdmDAO{

    private static final String NAMESPACE = "com.scv.web.mappers.adm.AdmMapper";

    private final SqlSession sqlSession;

    @Inject
    public AdmDAOImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    @Override
    public AdmVO login(AdmVO admVO)throws Exception{
        return sqlSession.selectOne(NAMESPACE + ".login", admVO);
    }
}
