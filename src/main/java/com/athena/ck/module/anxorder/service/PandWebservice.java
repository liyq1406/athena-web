package com.athena.ck.module.anxorder.service;

import java.util.List;

import javax.jws.WebService;

import com.athena.ck.entity.anxorder.AnxjssjSjerrException;
import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.PandModel;
import com.athena.ck.entity.anxorder.TranslateListToMapException;

@WebService
public interface PandWebservice 
{

	/**
	 * @SEE   将CDMD上次计算时间以及线边理论库存初始化到pandModels内
	 * @param pandModels
	 * @return
	 * @throws NoAnxjssjException
	 */
	public List<PandModel> initPandModel(List<PandModel> pandModels) throws NoAnxjssjException , TranslateListToMapException ;


	public void savePandModel(List<PandModel> pandModels) throws AnxjssjSjerrException,TranslateListToMapException;

}
