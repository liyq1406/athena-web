/**
 * 
 */
package com.toft.mvc.result.supports;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import com.athena.component.utils.PropertyUtils;

/**
 * @author dsimedd001
 *
 */
public abstract class AbstractExporter<T> implements Exporter {

	protected OutputStream output;
	
	protected Map<Object, Object> jsonResult;
	
	protected ExporterHeadInfo headInfo;

	public AbstractExporter(OutputStream output,ExporterHeadInfo headInfo,Map<Object, Object> jsonResult) {
		this.jsonResult = jsonResult;
		this.output = output;
		this.headInfo = headInfo;
	}
	
	public abstract void execute();

	@SuppressWarnings("unchecked")
	protected void processJsonResult(T container){
		int col=0;
		//表头处理
		for(String header:headInfo.getHeaders()){
//			String headerText;
//			try {
//				headerText = new String(header.getBytes("ISO-8859-1"),"GBK");
//			} catch (UnsupportedEncodingException e) {
//				headerText = "";
//			}
//			addHeadCell(container,0,col++,headerText);
			addHeadCell(container,0,col++,header);
		}
		
		//数据处理
		//TODO 数据格式有问题的情况
		Map<String,Object> result = 
			(Map<String, Object>) jsonResult.get("result");
		List<Object> rowDatas = (List<Object>) result.get("rows");
		
		for(int row=0;row<rowDatas.size();row++){
			col = 0;
			for(String property:headInfo.getProperties()){
				Object value = 
					PropertyUtils.getPropertyValue(rowDatas.get(row), property);
				if(value==null){
					value = "";
				}
				addCell(container,row+1,col++,value.toString());
			}
		}
	}

	/**
	 * 添加导出表头单元格
	 * @param container
	 * @param row
	 * @param col
	 * @param context
	 */
	abstract void addHeadCell(T container, int row, int col, String context);
	
	/**
	 * 添加数据单元格
	 * @param container
	 * @param row
	 * @param col
	 * @param context
	 */
	abstract void addCell(T container, int row, int col, String context);
	
}
