var sendUrl = {};
sendUrl.url = "http://192.168.1.10:8080/requisition-land-ws/";
sendUrl.res_getAllRes = sendUrl.url +"res/getAllRes";
sendUrl.operationRecordWS_queryPage = sendUrl.url + "operationRecordWS/queryPage";
sendUrl.fmlItem_getItems = sendUrl.url + "fmlItem/getItems";
sendUrl.fmlItem_getTransferInfo = sendUrl.url + "fmlItem/getTransferInfo";
sendUrl.fmlItem_getSSInfo = sendUrl.url + "fmlItem/getSSInfo";
sendUrl.fmlItem_getHptInfo = sendUrl.url + "fmlItem/getHptInfo";
sendUrl.onekeyQuery_getFuzzy = sendUrl.url + "onekeyQuery/getFuzzy";
sendUrl.onekeyQuery_getInfo = sendUrl.url + "onekeyQuery/getInfo";
sendUrl.operationRecordWS_addRecord = sendUrl.url + "operationRecordWS/addRecord";
sendUrl.visits_add = sendUrl.url + "visits/add";
sendUrl.visits_queryByFuzzy = sendUrl.url + "visits/queryByFuzzy";
sendUrl.visits_modify = sendUrl.url + "visits/modify";
sendUrl.fileType_addType = sendUrl.url + "fileType/addType";
sendUrl.fileType_getAll = sendUrl.url + "fileType/getAll";
sendUrl.fileType_delByIds = sendUrl.url + "fileType/delByIds";
sendUrl.fileType_queryByPid = sendUrl.url + "fileType/queryByPid";
sendUrl.fileType_modify = sendUrl.url + "fileType/modify";
sendUrl.archiveFile_addFile = sendUrl.url + "archiveFile/addFile";
sendUrl.archiveFile_modify = sendUrl.url + "archiveFile/modify";
sendUrl.archiveFile_delById = sendUrl.url + "archiveFile/delById";
sendUrl.archiveFile_queryByFuzzy = sendUrl.url + "archiveFile/queryByFuzzy";
sendUrl.archiveFile_queryByTypeId = sendUrl.url + "archiveFile/queryByTypeId";
sendUrl.archiveFile_queryByKeywords = sendUrl.url + "archiveFile/queryByKeywords";
sendUrl.procategory_add = sendUrl.url + "procategory/add";
sendUrl.procategory_edit = sendUrl.url + "procategory/edit";
sendUrl.procategory_del = sendUrl.url + "procategory/del";
sendUrl.procategory_queryAll = sendUrl.url + "procategory/queryAll";
sendUrl.removedInfo_query = sendUrl.url + "removedInfo/query";
sendUrl.removedInfo_add = sendUrl.url + "removedInfo/add";
sendUrl.removedInfo_edit = sendUrl.url + "removedInfo/edit";
sendUrl.removedInfo_del = sendUrl.url + "removedInfo/del";
sendUrl.removedInfo_addBatch = sendUrl.url + "removedInfo/addBatch";
sendUrl.fmlItem_idnumberExists = sendUrl.url + "fmlItem/idnumberExists";
sendUrl.indexData_getIndexData = sendUrl.url + "indexData/getIndexData";
sendUrl.operationRecordWS_queryData = sendUrl.url + "operationRecordWS/queryData";
sendUrl.statistics_getData = sendUrl.url + "statistics/getData";
sendUrl.addrProvider_getAddr = sendUrl.url + "addrProvider/getAddr";//1：项目地址，2：拆迁户地址，3：拆迁人员地址，4：信访人员地址，5：已迁户地址