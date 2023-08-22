//////////////////////비디오 히든 로직////////////////////////////

document.addEventListener("DOMContentLoaded", function() {
    var checkbox = document.getElementById("stop-video-checkbox");
    var videoContainer = document.getElementById("tsvideo-container");
    
    // 저장된 값 가져오기
    var hideUntilDate = localStorage.getItem("hideUntilDate");
   
    // 저장된 값이 있고, 현재 날짜보다 크면 동영상 숨김
    if (hideUntilDate && hideUntilDate >= getCurrentDate()) {
    videoContainer.style.display = "none";
    checkbox.checked = true;
    }
    
    checkbox.addEventListener("change", function() {
    if (checkbox.checked) {
    // 하루 동안 동영상 숨기기
    var nextDay = new Date();
    nextDay.setDate(nextDay.getDate() + 1);
    var hideUntilDate = formatDate(nextDay);
    localStorage.setItem("hideUntilDate", hideUntilDate);
    videoContainer.style.display = "none";
    } else {
    // 체크 해제 시 동영상 표시
    localStorage.removeItem("hideUntilDate");
    videoContainer.style.display = "block";
    }
    });
    
    // 현재 날짜 반환하는 함수
    function getCurrentDate() {
    var now = new Date();
    return formatDate(now);
    }
    
    // 날짜를 "YYYY-MM-DD" 형식으로 변환하는 함수
    function formatDate(date) {
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    return year + "-" + month + "-" + day;
    }
    });
   
   function closeVideo() {
    var videoContainer = document.getElementById("tsvideo-container");
    videoContainer.style.display = "none";
  }
  
  /*
  // The DOM element you wish to replace with Tagify
  var input = document.querySelector('input[name=postTag]');
  var whitelist = ["#혈압","#당뇨","#면역력 증진","#전립선 건강","#체지방 감소","#피로개선","#혈당","#비타민","#오메가","#피부건강"];
  // initialize Tagify on the above input node reference
  var tagify = new Tagify(input,{
      enforceWhitelist: true,
      whitelist : whitelist
  })
  $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
  tagify.on('input', e => console.log(e.detail));
  $('#hashtaglink a').click(function() {
      tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
  });
  tagify.on('add', e=> {
      $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
  });
  tagify.on('remove', e=> {
      $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
  });
  */
 
  ////////////////////슬라이드 로직///////////////////////////////////
  $(document).ready(function(){
   		
   		/*
      $('.slider1').bxSlider({
		  minSlides: 2,
		  maxSlides: 2,
		  slideWidth: 1050,
		  slideMargin: 10,
		  ticker: true,
		  speed: 40000
		});*/

      
      /* 처음 배너할 때 코드*/
      $('.slider1').bxSlider({
           slideWidth: 800,
           minSlides: 1,
           maxSlides: 1,
           slideMargin: 1,
           auto : true,
           stopAutoOnClick : true,
           pager : true,
      }); 
  });
  
  
      
  /////////////////////////////////지도 함수//////////////////////////////////////////////////////
  // 닫기 버튼 클릭 시 mapLayer 숨김
      var mapLayer = document.querySelector('.mapLayer');
          function closeMapLayer() {
              mapLayer.style.display = 'none';
          }
          
  // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(37.476815, 126.879473), // 지도의 중심좌표
              draggable: false,
              level: 3 // 지도의 확대 레벨
          };  
    //지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 지도에 마커를 표시합니다 
	var marker = new kakao.maps.Marker({
	    map: map, 
	    position: new kakao.maps.LatLng(37.476815, 126.879473)
	});
	
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title" style="background-color:#EF605D; color:white; font-weight:bold;">' + 
	            '            한소인 MEDI-Q' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="http://localhost:9090/images/mainicon.png" width="65" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">서울특별시 금천구<br/> 가산디지털2로 101</div>' + 
	            '                <div class="jibun ellipsis">(주) 한국소프트웨어아이엔씨<br/> (상세위치) B동 B304호(MEDI-Q팀)</div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
}
    
  //////////////////////지도 모달 맨위로 이동하기 방지//////////////////////////////
  $(document).ready(function() {
  var scrollPosition;
  
  $('#tsModal').on('show.bs.modal', function () {
    // 모달이 보이기 전에 현재 스크롤 위치를 저장합니다.
    scrollPosition = $(document).scrollTop();
    $('body').css({
      overflow: 'hidden',
      position: 'fixed',
      top : -scrollPosition // 스크롤 위치만큼 상단을 이동시킵니다.
    });
  });

  $('#tsModal').on('hidden.bs.modal', function () {
    // 모달이 닫힌 후에 원래의 스크롤과 스타일을 복원합니다.
    $('body').css({
      overflow: '',
      position: '',
      top: ''
    });
    $(document).scrollTop(scrollPosition);
  });

  $("#tsBtn").click(function() {
    $("#tsModal").modal({ backdrop: false });
    setTimeout(function() { map.relayout(); }, 0);
    initMap(); // 모달 열릴 때 지도 초기화 호출
  });
});
  
  
  /////////////////////////지도 모달 버튼 함수///////////////////////////////////
      $(document).ready(function() {
        $("#tsBtn").click(function() {
          $("#tsModal").modal({ backdrop: false});
          setTimeout(function(){ map.relayout(); }, 0);
          initMap(); // 모달 열릴 때 지도 초기화 호출
        });
      });
  
  //지도 모달로 띄우기 
      function initMap() {
          var markers = [];
          
          var mapContainer2 = document.getElementById('modalmap'), // 지도를 표시할 div 
          mapOption2 = {
                 center: new kakao.maps.LatLng(37.481387, 126.882676), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
          };  
  
          // 지도를 생성합니다    
          var map2 = new kakao.maps.Map(mapContainer2, mapOption2); 
          
          setTimeout(function(){ map2.relayout(); }, 0);
  
          //장소 검색 객체를 생성합니다
          var ps = new kakao.maps.services.Places();  
  
          //검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({zIndex:1});
  
          //키워드로 장소를 검색합니다
  
  		  document.querySelector("#sendSearchData").addEventListener("click",function() {
				console.log("버튼이 눌림");
				searchPlaces();
			});
          //키워드 검색을 요청하는 함수입니다
          function searchPlaces() {
	          var keyword = document.getElementById('keyword').value;
	  
	          if (!keyword.replace(/^\s+|\s+$/g, '')) {
	          	alert('키워드를 입력해주세요!');
	          }
	          // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	          ps.keywordSearch( keyword, placesSearchCB); 
          }
  
          //장소검색이 완료됐을 때 호출되는 콜백함수 입니다
          function placesSearchCB(data, status, pagination) {
	          if (status === kakao.maps.services.Status.OK) {
	  
	          // 정상적으로 검색이 완료됐으면
	          // 검색 목록과 마커를 표출합니다
	          displayPlaces(data);
	  
	          // 페이지 번호를 표출합니다
	          displayPagination(pagination);
  
	          } 
	          else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	  
	          alert('검색 결과가 존재하지 않습니다.');
	          return;
  
	          } else if (status === kakao.maps.services.Status.ERROR) {
	  
	          alert('검색 결과 중 오류가 발생했습니다.');
	          return;
	  
	          }
          }
  
          //검색 결과 목록과 마커를 표출하는 함수입니다
          function displayPlaces(places) {
  
          var listEl = document.getElementById('placesList'), 
          menuEl = document.getElementById('menu_wrap'),
          fragment = document.createDocumentFragment(), 
          bounds = new kakao.maps.LatLngBounds(), 
          listStr = '';
  
          // 검색 결과 목록에 추가된 항목들을 제거합니다
          removeAllChildNods(listEl);
  
          // 지도에 표시되고 있는 마커를 제거합니다
          removeMarker();
  
          for ( var i=0; i<places.length; i++ ) {
  
          // 마커를 생성하고 지도에 표시합니다
          var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
              marker = addMarker(placePosition, i), 
              itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
  
          // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(placePosition);
  
          // 마커와 검색결과 항목에 mouseover 했을때
          // 해당 장소에 인포윈도우에 장소명을 표시합니다
          // mouseout 했을 때는 인포윈도우를 닫습니다
          (function(marker, title) {
              kakao.maps.event.addListener(marker, 'mouseover', function() {
                  displayInfowindow(marker, title);
              });
  
              kakao.maps.event.addListener(marker, 'mouseout', function() {
                  infowindow.close();
              });
  
              itemEl.onmouseover =  function () {
                  displayInfowindow(marker, title);
              };
  
              itemEl.onmouseout =  function () {
                  infowindow.close();
              };
          })(marker, places[i].place_name);
  
          fragment.appendChild(itemEl);
          }
  
          // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
          listEl.appendChild(fragment);
          menuEl.scrollTop = 0;
  
          // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
          map2.setBounds(bounds);
          }
  
          //검색결과 항목을 Element로 반환하는 함수입니다
          function getListItem(index, places) {
  
          var el = document.createElement('li'),
          itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                  '<div class="info">' +
                  '   <h5>' + places.place_name + '</h5>';
  
          if (places.road_address_name) {
          itemStr += '    <span>' + places.road_address_name + '</span>' +
                      '   <span class="jibun gray">' +  places.address_name  + '</span>';
          } else {
          itemStr += '    <span>' +  places.address_name  + '</span>'; 
          }
                   
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                  '</div>';           
  
          el.innerHTML = itemStr;
          el.className = 'item';
  
          return el;
          }
  
          //마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
          function addMarker(position, idx, title) {
          var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
          imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
          imgOptions =  {
              spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
              spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
              offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
          },
          markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
              marker = new kakao.maps.Marker({
              position: position, // 마커의 위치
              image: markerImage 
          });
  
          marker.setMap(map2); // 지도 위에 마커를 표출합니다
          markers.push(marker);  // 배열에 생성된 마커를 추가합니다
  
          return marker;
          }
  
          //지도 위에 표시되고 있는 마커를 모두 제거합니다
          function removeMarker() {
          for ( var i = 0; i < markers.length; i++ ) {
          markers[i].setMap(null);
          }   
          markers = [];
          }
  
          //검색결과 목록 하단에 페이지번호를 표시는 함수입니다
          function displayPagination(pagination) {
          var paginationEl = document.getElementById('pagination'),
          fragment = document.createDocumentFragment(),
          i; 
  
          // 기존에 추가된 페이지번호를 삭제합니다
          while (paginationEl.hasChildNodes()) {
          paginationEl.removeChild (paginationEl.lastChild);
          }
  
          for (i=1; i<=pagination.last; i++) {
          var el = document.createElement('a');
          el.href = "#";
          el.innerHTML = i;
  
          if (i===pagination.current) {
              el.className = 'on';
          } else {
              el.onclick = (function(i) {
                  return function() {
                      pagination.gotoPage(i);
                  }
              })(i);
          }
  
          fragment.appendChild(el);
          }
          paginationEl.appendChild(fragment);
          }
          //검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
          //인포윈도우에 장소명을 표시합니다
          function displayInfowindow(marker, title) {
          var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
  
          infowindow.setContent(content);
          infowindow.open(map2, marker);
          }
  
          // 검색결과 목록의 자식 Element를 제거하는 함수입니다
          function removeAllChildNods(el) {   
              while (el.hasChildNodes()) {
               el.removeChild (el.lastChild);
              }
          }
    }
  
  /////////////////////////상단 메인 배너///////////////////////////////////////////////
  /*배너 영상돌리기*/
  function bannerSwitcher() {
      next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
      if (next.length) next.prop('checked', true);
      else $('.sec-1-input').first().prop('checked', true);
    }
  
    var bannerTimer = setInterval(bannerSwitcher, 5000);
  
    $('.controls label').click(function() {
      clearInterval(bannerTimer);
      bannerTimer = setInterval(bannerSwitcher, 5000)
    });
  
  
  /////////////////////////////////사이드바 함수 적용 라이브러리 적용///////////////////////
  $(document).ready(function() {
    $('.tsidebar').stick_in_parent();
  });
  
  
  /* 탑 네브바 테스트용
  (function ($) {
      "use strict";
  
  
      // Initiate the wowjs
      new WOW().init();
  
  
      // Sticky Navbar
      $(window).scroll(function () {
          if ($(this).scrollTop() > 45) {
              $('.navbar').addClass('sticky-top shadow-sm');
          } else {
              $('.navbar').removeClass('sticky-top shadow-sm');
          }
      });
      
      
      // Dropdown on mouse hover
      const $dropdown = $(".dropdown");
      const $dropdownToggle = $(".dropdown-toggle");
      const $dropdownMenu = $(".dropdown-menu");
      const showClass = "show";
      
      $(window).on("load resize", function() {
          if (this.matchMedia("(min-width: 992px)").matches) {
              $dropdown.hover(
              function() {
                  const $this = $(this);
                  $this.addClass(showClass);
                  $this.find($dropdownToggle).attr("aria-expanded", "true");
                  $this.find($dropdownMenu).addClass(showClass);
              },
              function() {
                  const $this = $(this);
                  $this.removeClass(showClass);
                  $this.find($dropdownToggle).attr("aria-expanded", "false");
                  $this.find($dropdownMenu).removeClass(showClass);
              }
              );
          } else {
              $dropdown.off("mouseenter mouseleave");
          }
      });
  
      
      
      // Back to top button
      $(window).scroll(function () {
          if ($(this).scrollTop() > 300) {
              $('.back-to-top').fadeIn('slow');
          } else {
              $('.back-to-top').fadeOut('slow');
          }
      });
      $('.back-to-top').click(function () {
          $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
          return false;
      });
  
  
      // Testimonials carousel
      $(".testimonial-carousel").owlCarousel({
          autoplay: true,
          smartSpeed: 1000,
          center: true,
          margin: 24,
          dots: true,
          loop: true,
          nav : false,
          responsive: {
              0:{
                  items:1
              },
              768:{
                  items:2
              },
              992:{
                  items:3
              }
          }
      });
      
  });
       */
  /*메거진 슬라이드 로직 */
   var angle = 0;
function galleryspin(sign) { 
spinner = document.querySelector("#spinner");
if (!sign) { angle = angle + 45; } else { angle = angle - 45; }
spinner.setAttribute("style","-webkit-transform: rotateY("+ angle +"deg); -moz-transform: rotateY("+ angle +"deg); transform: rotateY("+ angle +"deg);");
}

/*스크롤 내릴 때 애니메이션 처리 */
$(document).ready(function() {
  // Check if element is scrolled into view
  function isPartiallyVisible(elem) {
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom >= docViewTop) && (elemTop <= docViewBottom));
  }

  //페이드 인 아웃 효과
  $(window).scroll(function() {
    $('.tssection .animatedleft').each(function() {
      if (isPartiallyVisible(this) === true) {
        $(this).addClass('fadeInLeft');
      }
    });
 	$('.tssection .animatedright').each(function() {
      if (isPartiallyVisible(this) === true) {
        $(this).addClass('fadeInRight');
      }
    });
  });
 });
  