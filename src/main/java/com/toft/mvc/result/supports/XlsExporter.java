package com.toft.mvc.result.supports;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import com.toft.core2.ToftException;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;


public class XlsExporter extends AbstractExporter<WritableSheet> implements Exporter {
	public XlsExporter(OutputStream output,ExporterHeadInfo headInfo, Map<Object, Object> jsonResult) {
		super(output,headInfo,jsonResult);
	}

	public void execute() {
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(output);
			WritableSheet sheet = workbook.createSheet("sheet", 0);
			this.processJsonResult(sheet);
			workbook.write();
			try {
				workbook.close();
			} catch (WriteException e) {
				ToftException.ThrowToftException("999999", e);
			}
		} catch (IOException e) {
			ToftException.ThrowToftException("999999", e);
		}
	}
	
	@Override
	void addHeadCell(WritableSheet container, int row, int col, String context) {
		addSheetCell(container,row,col,context);
	}

	@Override
	void addCell(WritableSheet container, int row, int col, String context) {
		addSheetCell(container,row,col,context);
	}
	
	/**
	 * 添加sheet单元格
	 * @return
	 */
	private void addSheetCell(WritableSheet sheet,int row,int col,String text){
		if(text==null||text.equals(""))return;
		//
		jxl.write.Label cell = new Label(col,row, text==null?"":text);
		try {
			sheet.addCell(cell);
		} catch (RowsExceededException e) {
			ToftException.ThrowToftException("999999", e);
		} catch (WriteException e) {
			ToftException.ThrowToftException("999999", e);
		}
	}

}
