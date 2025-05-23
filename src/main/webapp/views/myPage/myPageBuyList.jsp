<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 정보</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">

<!-- rating.js(별점) -->
<link rel="stylesheet"
	href="/resources/assets/extensions/rater-js/lib/style.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
	.tit-area{
		display: flex; 
	}
	
	#home,#schedule{
		width: 200px;
	}
	
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 20%;
	}
	.form-control{
		width: 350px;
	}
	.pagination {
    justify-content: center; /* 페이지네이션 중앙 정렬 */
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

			<div class="page-content">
				<section id="menu">
					<h4 class="menu-title">나의 정보</h4>
					<ul>
						<li id="firstMenu"><a href="/myPageView">나의 정보</a></li>
						<li id="secondMenu"><a href="/trip/listView">출장</a></li>
						<li id="secondMenu"><a href="/myPageSign">서명 관리</a></li>
						<li id="secondMenu" class="active"><a href="/myPageBuy">구매기록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>구매/사용 기록</h5>
						</div>
						<div class="cont-body">
							<div class="row">
								<div class="col-5 col-lg-5"></div>
								<div id="searchLayout"  class="col-7 col-lg-7">
									<select id="searchOption" class="form-select selectStyle">
										<option value="name">상품명</option>
									</select>
									<input type="text" id="searchKeyword" name="search" class="form-control search" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary"><i class="bi bi-search"></i></button>
								</div>
							</div>
							<div class="row">
							<div class="col-12 col-lg-12">
							<table>
								<colgroup>
									<col>
									<col >
									<col>
									<col>
									<col >
								</colgroup>
								<thead>
									<tr>
										<th>상품명</th>
										<th >가격</th>
										<th>구매/사용</th>
										<th>갯수</th>
										<th>구매일</th>
									</tr>
								</thead>
								<tbody id="list">
									
								</tbody>
								
						             
							</table>
						                <nav aria-label="Page navigation">
						                 <ul class="pagination" id="pagination"></ul>
						                </nav>
							
							</div>
							</div>
						</div> 
					</div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
				</section>
			</div>
		</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>


<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>



<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script>
var show = 1;
var cnt = 10; // 한 페이지당 항목 수
var url = '/myPageBuy/List'; // 서버 요청 URL
var paginationInitialized = false;

$(document).ready(function () {
    pageCall(show); // 초기 페이지 호출

    // 검색 버튼 클릭 이벤트 추가
    $('.btn-primary').on('click', function () {
        pageCall(1); // 첫 번째 페이지에서 검색 시작
    });

    // Enter 키로도 검색 가능하도록 처리
    $('#searchKeyword').on('keypress', function (e) {
        if (e.which === 13) { // Enter 키 코드
            pageCall(1);
        }
    });
});

function pageCall(page) {
	console.log(page);
    var keyword = $('#searchKeyword').val(); // 검색어
    var opt = $('#searchOption').val(); // 검색 옵션

    var requestData = {
        page: page,
        cnt: cnt,
        opt: opt,
        keyword: keyword
    };

    $.ajax({
        type: 'GET',
        url: url,
        data: requestData,
        dataType: 'JSON',
        success: function (data) {
            console.log(data);
            renderList(data.list);

            if (paginationInitialized) {
                $('#pagination').twbsPagination('destroy'); // 기존 페이지네이션 제거
            }

            if (data.totalPages > 0) {
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages,
                    visiblePages: 10,
                    startPage: page,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, page) {
                        pageCall(page);
                    }
                });
                paginationInitialized = true;
            } else {
                paginationInitialized = false;
            }
        },
        error: function (e) {
            console.error(e);
        }
    });
}

function renderList(list) {
    var content = '';
    if (list.length === 0) {
        content = '<tr><td colspan="5" style="text-align: center;">데이터가 없습니다.</td></tr>';
    } else {
        for (var view of list) {
            var formattedDate = view.create_date
                ? view.create_date.replace('T', ' ').split('.')[0]
                : '-';

            content += '<tr>';
            content += '<td>' + view.meal_name + '</td>';
            content += '<td>' + (view.total_cost || '-') + '</td>';
            content += '<td style="color: ' + (view.is_buy === 'B' ? 'blue' : 'black') + ';">'
                + (view.is_buy === 'B' ? '구매' : '사용') + '</td>';
            content += '<td>' + (view.count || '0') + '</td>';
            content += '<td>' + formattedDate + '</td>';
            content += '</tr>';
        }
    }
    $('#list').html(content);
}


</script>

</html>