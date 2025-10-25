package com.groo.model;

import lombok.Data;

@Data
public class AdminAvgReportDTO {
	private String totalReport;
	private String resolverReport;
	private String newReport;
	private String pendingReport;
}
