<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기안문 상세보기</title>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">





<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
	.draftDetail table{
		border: 1px solid #ddd;
		table-layout: auto;
	}
	.draftDetail table th, .draftDetail table td{
		padding: 4px 10px;
		border-right: 1px solid #ddd;
		border-width: 1px;
	}
	.draftDetail input{
		width: 100%;
	    height: 100%;
	    border: none;
    }
	.draftDetail .top-area {
		display: flex;
	    justify-content: space-between;
	}
	.draftDetail .top-area > table {
		width: 340px;
	}
	.draftDetail table.user_info th{
		width: 120px;
	}
	.draftDetail table.user_info input {
		width: 100%;
		border: none;
	}
	.draftDetail table.appr_line {
		width: 410px;
	}
	.draftDetail table.appr_line th{
		width: 44px;
	}
	.draftDetail table.appr_line .date{
		font-size: 13px;
	}
	.draftDetail .buttons {
	    border-bottom: 1px solid #ddd;
	    padding: 4px 40px;
    }
	.draftDetail .buttons .btn {
	    margin: 14px 2px;
	}
	.draftDetail h4.doc-subject{
		margin: 20px 0 50px;
		text-align: center;
	}
	
	.draftDetail .btm-area {
		display: flex;
		flex-wrap: wrap;
		border-left: 1px solid #ddd;
	 	border-top: 1px solid #ddd;
	 	margin-top : 40px;
	}

	.draftDetail .btm-area .line{
		display: flex;
		width: 50%;
	}
	
	.draftDetail .btm-area .line > div {
	    border-right: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	
	.draftDetail .btm-area .tit {
		width: 160px;
	    border-width: 1px;
	    background: #f5f5f5;
	    padding: 7px 16px;
	    font-weight: 600;
	    text-align: center;
	}

	.draftDetail .btm-area .txt {
		width: calc(100% - 160px);
	}
	
	.txt-area{
		height: 400px;
		border: 1px solid #ddd;
    	border-top: none;
	}
	
	
	/* file */
	div.attach_file {
		border:1px solid #ddd;
		border-top: none;
	}
	div.attach_file ul.file_wrap {
		margin-top:0; 
		background:#f5f5f5;
	}
	div.attach_file ul.file_wrap > li {
		padding: 8px; 
		border-top:1px solid #e6e6e6;
	}
	div.attach_file div.attach_file_header {
		position:relative; 
		background:#f7f7f7; 
		padding:8px;
	}
	div.attach_file div.attach_file_header span.subject span.ic_file_s {
		vertical-align:top; 
		margin-top:0;
	}
	div.attach_file div.attach_file_header span.subject span.num {
		margin-left:-1px;
	}
	div.attach_file div.attach_file_header span.subject span.etc {
		font-size:11px; 
		color:#777; 
		letter-spacing:-1px;
	}
	div.attach_file div.attach_file_header span.subject span.etc strong {
		color:red; 
		font-weight:normal; 
		letter-spacing:0;
	}
	div.attach_file span.btn_area {
		position:absolute; 
		top: 9px; 
		right: 12px; 
		margin-left:20px; 
		text-align:right;
	}
	div.attach_file span.btn_area span.btn_wrap {
		font-size: 13px;
	}
</style>

</head>

<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">

		<!-- 사이드바 -->
		<jsp:include page="../sidebar.jsp" />

		<div id="main">
			<!-- 헤더 -->
			<jsp:include page="../header.jsp" />

			<div class="page-content draftDetail">
				<section id="menu">
					<h4 class="menu-title">사내메일</h4>
					<ul>
						<li class="active"><a href="#">받은메일함</a></li>
						<li><a href="#">보낸메일함</a></li>
						<li><a href="#">임시보관함</a></li>
						<li><a href="#">중요메일함</a></li>
						<li><a href="#">휴지통</a></li>
					</ul>
					<div class="btn btn-primary full-size">사사이드바 버튼</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>결재 작성</h5>
						</div>
						<div class="buttons">
							<button href="#" class="btn btn-outline-primary">돌아가기</button>
							<button href="#" class="btn btn-outline-primary">수정(임시저장문서만)</button>
						</div>
						<div class="cont-body">  
							<h4 class="doc-subject">업무 기안 (브랜드 등록)</h4>
							<form action="" method="POST">
							
								<div class="top-area">
									<table class="user_info">
										<tr>
											<th>기안자</th>
											<td><input type="text" name="user_id" value="홍길동" readonly/></td>
										</tr>
										<tr>
											<th>기안일</th>
											<td><input type="text" name="create_date" value="홍길동" readonly/></td>
										</tr>
										<tr>
											<th>소속</th>
											<td><input type="text" name="team_name" value="홍길동" readonly/></td>
										</tr>
										<tr>
											<th>문서번호(임시저장문서는 X)</th>
											<td><input type="text" name="document_number" value="B20241352" readonly/></td>
										</tr>
									</table>
									
									<table class="appr_line">
										<tr>
											<th rowspan="3">결재</th>
											<td>사원</td>
											<td>차장</td>
											<td>부장</td>
											<td>대표</td>
										</tr>
										<tr>
											<td>
												<img src="/resources/common/sign.png" alt="도장"/>
												<p>홍길동</p>
											</td>
											<td>
												<img src="/resources/common/sign.png" alt="도장"/>
												<p>홍길동</p>
											</td>
											<td>
												<img src="/resources/common/sign.png" alt="도장"/>
												<p>홍길동</p>
											</td>
											<td>
												<img src="/resources/common/sign.png" alt="도장"/>
												<p>홍길동</p>
											</td>
										</tr>
										
										<tr class="date">
											<td>2024-12-01</td>
											<td>2024-12-01</td>
											<td>2024-12-01</td>
											<td>2024-12 -01</td>
										</tr>
										
									</table>
									
								</div>
								
								<div class="btm-area">
									<div class="line">
										<div class="tit">제목</div>
										<div class="txt"><input type="text" name="subject"/></div>
									</div>
									<div class="line">
										<div class="tit">협조부서</div>
										<div class="txt"><input type="text" name="cooper_dept_id"/></div>
									</div>
									<div class="line">
										<div class="tit">브랜드명</div>
										<div class="txt"><input type="text" name="target_name"/></div>
									</div>
									<div class="line">
										<div class="tit">시행일자</div>
										<div class="txt"><input type="text" name="from_date"/></div>
									</div>
								</div>
								<div class="txt-area"></div>
								
								<div id="attachView">
									<div class="attach_file" style="display:">
										<div class="attach_file_header">
											<span class="subject">
												<span class="ic ic_file_s"></span>
												<strong>첨부파일</strong>
												<span class="num">0</span>개
												<span class="size">(0.0Byte)</span>
											</span>
										</div>
										<ul class="file_wrap" id="file_wrap"></ul>
										<ul class="img_wrap" id="img_wrap" style="margin-bottom: 10px; margin-left: 10px; margin-right: 10px; margin-top: 0px;"></ul>
									</div>
								</div>								

								
							</form>

						</div>
					</div> 
				</section>
			</div>
		</div>
	</div>
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<!-- 파일업로더 -->
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="/resources/assets/extensions/filepond/filepond.js"></script>
<script src="/resources/assets/static/js/pages/filepond.js"></script>

	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/menu.js'></script>
<script src='/resources/js/textEaditor.js'></script>
<script>




</script>

</html>