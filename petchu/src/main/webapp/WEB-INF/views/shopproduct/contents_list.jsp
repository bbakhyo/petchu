<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Content list</title>
<link href="/resources/temp_page.css" rel="stylesheet">
<style>
	
#page{
  display:flex;
  flex-direction:column;
  font-family:NanumGothic;
}
.page_border{
  border:1px solid black;
}
.menu_item_title{
  font-size:13px;
  font-family:NanumGothic;
  font-weight: 700;
  letter-spacing:-0.5px;
  line-height:15px;
  text-align:center;
  margin-top:10px;
}

.content_item_container_row{
  display:flex;
  flex-direction:row;
  width:960px;
  flex-wrap:wrap;
  gap:10px;
}
.content_item_box_container{
  display:flex;
  flex-direction:column;
  width:180px;
  height:346px;
  box-shadow:5px 5px 15px 5px rgba(0,0,0,0);
  border:1px solid #d1d0cf;
  margin-bottom:20px;
}

.content_item_box_container:hover{
	border:solid 1px blue;
}
 .content_item_title{
    font-size:13px;
    height: 60px;
    padding:10px;
  }  
.content_item_price{
  display:flex;
  justify-content:space-between;
  align-items:center;
  width:100%;
  height: 45px;
/*   background-color:#f07f7f; */
}
.price_item1{
  font-size:13px;
  font-weight:700;
  padding: 10px;
}
.price_item2{
  font-size:15px;
  color:blue;
  padding: 10px;
}
.content_item_title_row{
  align-items:flex-end;
  width:100%;
  height: 45px;
  background-color:#f5f5f5;
}
.content_item_title{
  padding:10px;
}

.content_banner_area{
  display:flex;
  flex-direction:row;
  gap:0;
}
.content_img{
width:180px;
height:180px;
}
</style>
</head>
<body>
	<div id="page">
		<h1 class="contents_name">해당 컨텐츠의 전체 내용  "${cate}", "${cate2}"</h1>
		 <div class="content_container">
	    	<div class="content_item_container_row"></div> 
	    	
	      <script id="temp" type="text/x-handlebars-template">

	{{#each .}}
      <div class="content_item_box_container" pno="{{pno}}">
        <img src="{{pimage}}" class="content_img" alt="https://via.placeholder.com/200x200/d3d3d3">
        	<div class="content_item_title" pno="{{pno}}">{{pname}}</div>
        	<div class="content_item_price">
          		<div class="price_item1">{{comma pprice}}</div> 
       		</div>
        	<div class="content_item_title_row">
				<div class="content_item_title">{{replace pbrand}}</div>   
       		</div>
		</div>
	{{/each}}
        </script>		  
	 	 </div> 
	 </div>

</body>


<script>
/*Brand명이 없으면 'House Brand를 러턴 */
	Handlebars.registerHelper("replace",function(pbrand){
		var replace ='House Brand';
		if(pbrand==''){
			return replace;
		}else{
			return pbrand;
		}	
	});
	Handlebars.registerHelper("comma", function(pprice) {
		return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	})
	
</script>

<script>
	var selectCate="${cate}";
	var selectCate2="${cate2}";
	getContentsList();
	
	$(".content_container").on("click", function(){
		var row = $(this).find(".content_item_box_container");
		var pno =row.attr("pno");
		location.href="read?pno="+pno+"&selectCate="+selectCate+"&selectCate2="+selectCate2; 
	});
	
	
	function getContentsList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/shopproduct/contents_list.json?selectCate="+selectCate+"&selectCate2="+selectCate2,
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$(".content_item_container_row").html(template(data));
				
			}
		});
	}
</script>