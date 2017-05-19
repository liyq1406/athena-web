package com.toft.mvc.result.supports;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

public class TxtExporter extends AbstractExporter<StringBuffer> implements Exporter {

	public TxtExporter(OutputStream out,ExporterHeadInfo headInfo,Map<Object, Object> jsonResult) {
		super(out,headInfo, jsonResult);
	}

	public void execute() {
		StringBuffer txtBuf = new StringBuffer();
		this.processJsonResult(txtBuf);
		try {
			output.write(txtBuf.toString().getBytes());
		} catch (IOException e) {
			//
		}
	}

	@Override
	void addHeadCell(StringBuffer container, int row, int col, String context) {
		this.addStringCell(container, row, col, context);
	}

	@Override
	void addCell(StringBuffer container, int row, int col, String context) {
		this.addStringCell(container, row, col, context);
	}
	
	private void addStringCell(StringBuffer container, int row, int col, String context){
		int cols = headInfo.getHeaders().length;
		container.append(context);
		if(col==cols-1){
			container.append("\r");
		}else{
			container.append(",");
		}
	}
}
