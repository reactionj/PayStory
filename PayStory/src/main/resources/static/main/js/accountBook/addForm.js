/**
 * addExpenditureForm.js
 *  - 지출 항목 추가 form 이벤트
 */

 $(function(){
	/***** 엔터키 submit 안 되게 OK *****/
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) e.preventDefault();
	});
	
	/***** 영수증 이미지 영역 *****/
	// 파일 업로드 OK
	$("#uploadReceipt").on('change',function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
	  	$(".custom-file-label").text(fileName.substring(12));
	  	
	  	// 이미지 영역에 미리보기
	  	let file = e.target.files;
	  	let fileArr = Array.prototype.slice.call(file);
	  	
	  	fileArr.forEach(function(f){
			if(!f.type.match('image.*')) {
				alert("이미지 파일만 가능합니다.");
				return;
			}
			
			let render = new FileReader();
			render.onload = function(e){
				$('#receiptImg').attr('src', e.target.result);
				$('#receiptImg').css({
					'width':'100%',
					'height':'95%'
				});
				$('#imgArea').addClass('hasImage');
				$('.hasImage').attr({
					'data-toggle' : 'modal',
					'data-target' : '#receiptModal'
				});
			}
			render.readAsDataURL(f);
		});
	});
	
	// 이미지 영역 클릭 이벤트 : 이미지가 있으면 modal에 이미지 넣기 OK
	$('#imgArea').on('click', function(){
		if($(this).hasClass('hasImage')){
			$('#receiptImgModal').attr('src', $(this).find('#receiptImg').attr('src'));
		}else{
			alert('이미지를 업로드 해주세요.');
		}		
	})
	
	// 반응형 CSS 설정 OK
	$(window).resize(function(){
		if($(window).width() <= 990) {
			$('#receiptImg').addClass('hidden');
			$('.tooltipContent').addClass('hidden');
		}else {
			$('#receiptImg').removeClass('hidden');
			$('.tooltipContent').removeClass('hidden');
		}
	});
	
	/******** 아이템 영역  ********/
	// 아이템 보기 버튼 클릭 - css 적용 OK
	$('.showItem').on('click', function(){
		$('.fa-angle-down').toggleClass('open');
	});
	
	// 아이템 추가 OK
	$('#addItem').on('click', function(e){
		e.preventDefault();
		// 내용
		let itemHTML = '<div class="col-7">'+
				   '<input type="text" class="expenditureItem form-control form-control-sm shadow-none">'+'</div>';
		// 금액
		let priceHTML = '<div class="col-4">'+
					  '<input type="text" class="expenditureItemAmount form-control form-control-sm shadow-none">'+'</div>';
		// 삭제 버튼
		let removeHTML = '<div class="col-1"><button class="removeItem btn shadow-none p-0"><i class="fas fa-minus-circle"></i></button></div>';
		
		let addItemDiv = '<div class="item form-group form-row" id="newItem">'+itemHTML+priceHTML+removeHTML+'</div></div>';
		$('#itemWrap').append(addItemDiv);
	});
	
	// 아이템 삭제 OK
	$(document).on('click', '.removeItem' ,function(e){
		e.preventDefault();
		let currentItem = $(this).parent().parent();
		
		// 삭제 전에 합계 금액에서 빼기 OK
		let thisItemAmount = $(this).parent().prev().find('.expenditureItemAmount').val();
		if(thisItemAmount != ''){
			let totalAmount = parseInt(withoutComma($('#expenditureTotalAmount').val()));
			let currentAmount = totalAmount - parseInt(withoutComma(thisItemAmount));
			$('#expenditureTotalAmount').val(withComma(currentAmount));
		}
		
		// 맨 위의 아이템이면
		if(currentItem.hasClass('default')){
			currentItem.find('.expenditureItem').val(' ');
			currentItem.find('.expenditureItemAmount').val(' ');
		}else {
			currentItem.remove(); 
		}
	});
	
	// 내용 입력란 keydown 이벤트 : 엔터 눌렀을 때, 입력한 값이 있다면 금액 입력란으로 focus OK
	$(document).on('keydown', '.expenditureItem', function(e){
		if(e.keyCode == 13) {
			let inputAmount = $(this).parent().next().find('.expenditureItemAmount');
			inputAmount.focus();
		}
	});
	
	// 금액 입력란 keydown 이벤트 : 엔터 눌렀을 때, 입력한 값이 있고, 다음 칸이 있다면 다음 내용 입력란 focus OK
	$(document).on('keydown', '.expenditureItemAmount', function(e){
		if(e.keyCode == 13) {
			let inputItem = $(this).parent().parent().next().find('.expenditureItem');
			if(inputItem) inputItem.focus();
		}
	});
	
	/***** 금액 입력 EVENT *****/
	// 금액 천단위 콤마 생성
	function withComma(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	// 금액 콤마 해제
	function withoutComma(num) {
		return num.toString().replace(",", '');
	}
	
	// 금액 입력란 keyup 이벤트
	$(document).on('keyup', '.expenditureItemAmount', function(){
		// 숫자만 입력
		$(this).val($(this).val().replace(/[^0-9]/g, ''));
		
		// 콤마
		let amount = $(this).val() || '0';
		let amountWithComma = withComma(parseInt(amount));
		$(this).val(amountWithComma);
	});
	
	/***** 합계 ****/ 
	function sumAmount(){
		let sum = 0; 
		$('.expenditureItemAmount').each(function(){
			let itemAmount = $(this).val();
			if(itemAmount){
				sum += parseInt(withoutComma(itemAmount));
			}
		});
		$('#expenditureTotalAmount').val(withComma(sum));
	}
	
	// 금액 입력란에서 focusout 되면 합계 OK
	$(document).on('focusout', '.expenditureItemAmount', function(){
		sumAmount();
	});
	
	/****** 메모 ******/
	// 메모 글자수 제한
	$('.memoBox').on('keyup', function(){ 
		let content = $(this).val(); 
		// 글자수 세기 
		if (content.length == 0 || content == '') { 
			$('.textCount').text('0'); 
		} else { 
			$('.textCount').text(content.length); 
		} 
		
		// 글자수 제한 
		if (content.length > 100) { 
			// 100자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 100)); 
			// 100자 넘으면 알림창 뜨도록 
			alert('글자수는 100자까지 입력 가능합니다.'); 
		} 
	});
});