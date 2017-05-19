/**
 * 
 */
package com.toft.mvc.result.supports;

import java.io.OutputStream;
import java.util.Map;

/**
 * @author dsimedd001
 *
 */
public class ExportFactory {

	public final static String EXPORT_TYPE_XLS="xls"; 
	public final static String EXPORT_TYPE_TXT="txt";
	
	/**
	 * 
	 * 
	 * @param export 导出类型
	 * @param jsonResult  json数据
	 * @param writer writer
	 * @return
	 */
	public static void export(String exportType, 
			ExporterHeadInfo headerInfo,
			Map<Object, Object> jsonResult, 
			OutputStream output) {
		if(exportType==null)return;//快速返回
		Exporter exporter = null;
		if(EXPORT_TYPE_XLS.equals(exportType)){
			exporter = new XlsExporter(output,headerInfo,jsonResult);
		}else if(EXPORT_TYPE_TXT.equals(exportType)){
			exporter = new TxtExporter(output,headerInfo,jsonResult);
		}
		exporter.execute();
	}

	public static String createContentType(String exportType) {
		if(EXPORT_TYPE_XLS.equals(exportType)){
			return "application/octet-stream;charset=UTF-8";
		}else if(EXPORT_TYPE_TXT.equals(exportType)){
			return "application/octet-stream;charset=UTF-8";
		}
		return  "application/x-json; charset=UTF-8";
	}

}
