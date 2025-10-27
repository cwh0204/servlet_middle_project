
/* 카카오 지도 고정 좌표 사용 */

window.onload = function() {
    // 대전 중구 계룡로 846 3층 좌표 (위도, 경도)
    var coords = new kakao.maps.LatLng(36.3225, 127.4235); 

    var mapContainer = document.getElementById('map-container'); 
    var mapOption = {
        center: coords, // 지도 중심
        level: 3 // 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커 생성
    var marker = new kakao.maps.Marker({
        position: coords
    });
    marker.setMap(map);

    // 마커에 정보창 표시
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:5px;">대전 중구 계룡로 846 4층 - Groo</div>'
    });
    infowindow.open(map, marker);
};
