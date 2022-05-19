
function contentInfo(title, poster, cast, userId, director, plot, filepath, price){
	let code =  '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
	    code += '  <div class="modal-dialog">';
	    code += '   <div class="modal-content">';
	    code += '	  <div class="modal-header">';
	    code += '  			<h2 class="modal-title">'+title+'</h2>';
	    code += '  		<button type="button" class="btn" style="color:#fff; font-size:1.3rem;" data-bs-dismiss="modal"><i class="fas fa-times"></i></button> ';
	    code += '  	</div>';
	    code += '   <div class="modal-body">';
	    code += '  		<div class="form-group mb-5">';
	    code += '  			<iframe id="frame" width="400" height="300" style=" display:block; margin:auto" src="'+ filepath +'"></iframe>';
	    code += '  		</div>';
	    code += '  		<div class="d-flex justify-content-end mb-2"> ';
	    code += '  			<button type="button" class="btn btn-primary" style="margin-right:5px; line-height: 1;" role="addCart" data-title="'+title+'" data-poster="'+poster+'" data-price="'+price+'"><i class="fas fa-shopping-cart" style="text-shadow: 2px 2px 5px #00000088;"></i></button> ';
	    code += '  			<button type="button" class="btn btn-danger" style="margin-right:5px; line-height: 1;" role="addWishList"><i class="far fa-heart"></i></button>';
	    code += '  		</div>';	    
	    code += '  		<div class="form-group mb-3">';
	    code += '  			<span>감독    : </span>'+ director +'<br><br>';
	    code += '  			<span>출연진 : </span>'+ cast +'<br><br>';
	    code += '  			<span>줄거리 : '+ plot +'</span>';
	    code += '  		</div>';
	    code += '  	</div>';
	    code += '  	</div>';
	    code += '  	</div>';
	    

	    $('#modalArea').html(code);
	    $('#myModal').modal('show',{backdrop: false});
	    
	    //시청기록 추가
	    viewList(userId, title);
	    

	    //위시리스트(찜목록) 추가
	    $('button[role=addWishList]').on('click', function(){
	    	addWishList(userId, title);
	    })
	        
}

function addWishList(userId, title){
	
	$.ajax({
		url: '/Dditflix/user/myPage/addWishList.do',
		method: 'post',
		data: {'title' : title,
			   'userId' : userId
			   },
		success : function(a){
			if(a.ok == "성공"){
				alert("찜목록에 등록되었습니다!");
			}else{
				alert("이미 찜목록에 등록되어 있습니다!");
			}
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});	
}


function viewList(userId, title){
	
	$.ajax({
		url: '/Dditflix/user/home/insertHistory.do',
		method: 'post',
		data: {'title' : title,
			   'userId' : userId
			   },
		success : function(){},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});
	
}