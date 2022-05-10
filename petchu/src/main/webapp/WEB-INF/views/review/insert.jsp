<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<head>
	<link href="/resources/insert.css" rel="stylesheet"/>
</head>
	<div id="page">
  <form name="frm" method="post" enctype="multipart/form-data">
  <div class="insert_page">
   <div class="page_title">
			<h2>REVIEW</h2>
		</div>
   
     <div class="page_info"><!--helpcount까지-->
        <div class="inin_page"><!--한줄요약까지-->
          <div class="r_q">
          <h3>상품품질리뷰</h3>
          <p>상품에 대해서 얼마나 만족하시나요?</p>
          </div><!--r_q--> 
         <div class="p_info">
         	<div class="bno">
         		<div id="bno">${vo.bno}</div>
         		<div id="pno">${vo.pno}</div>
         	</div>
           	<div id="p_img">
				 <img src="${vo.pimage}" width=200 height=200/>
			</div>
           <div class="p_ns">
             <div id="pname">
               <div>${vo.pname}</div>
             </div>
             <div id="reveiw_c"></div>
             <script id="temp" type="text/x-handlebars-template">
				
			</script>
             
             <div id="star">
               <div></div>
             </div>
           </div>
          </div>
          <div class="review_e">
            <div class="d_review">
              <h2>상세리뷰<h2>
            </div>
            <div class="textarea">
              <textarea name="content" rows="10" cols="80"
					placeholder="리뷰는 10자 이상 작성부탁드립니다"></textarea>
					</div>
          </div>
          <div class="r_photo">
            <div class="photo_a">
              <p>사진첨부</p>
            </div>
            <div class="box1"></div>
            <div class="file"><button>사진첨부하기</button></div>
          </div>
          <div class="rtitle">
            <div><p>한줄요약</p></div>
            <div id="rtitle">
              <div class="textarea">
                <textarea name="content" rows="3" cols="80"
					placeholder="한 줄 요약을 입력해주세요"></textarea>
              </div>
            </div>
          </div><!--rtitle-->
         </div><!--inin_page-->
            <div class="h_info">
              <div class="satisfaction"><p>만족도</p></div>
              <div>
              </div>
            </div>
        </div><!--page_info-->
          <div class="button">
            <button class="reset" type="reset">취소하기</button>
            <div class="box"></div>
            <button class="submit" type="submit">등록하기</button>
            </div>
      </div><!--insert_page-->
    </form>
  </div>
<script>
	//submit 버튼을 클릭한 경우
	$(frm).on(".submit", function(e){
		e.preventDefault();
		var content=$(frm.content).val();
		
		if(content==""){
			alert("리뷰를 입력해주세요");
			$(frm.content).focus();
			return;
		}
		if(!confirm("리뷰를 등록하실래요?")) return;
		frm.submit();
		alert("리뷰등록완료");
		
	});
</script>
