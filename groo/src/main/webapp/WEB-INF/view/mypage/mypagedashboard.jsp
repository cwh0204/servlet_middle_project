<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 달력</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<link href="css/base.css" rel="stylesheet">
<style>
/* 캘린더 전용 스타일 */
.calendar-container {
    width: 450px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin: 20px auto;
}

.calendar-header {
    background-color: #4CAF50;
    color: white;
    padding: 20px 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 1.5em;
    font-weight: bold;
}

.calendar-header .nav-btn {
    background: none;
    border: none;
    color: white;
    font-size: 1.5em;
    cursor: pointer;
    padding: 0 15px;
    outline: none;
    line-height: 1; 
}

.calendar-header .nav-btn:hover {
    color: #c8e6c9;
}

.calendar-table {
    width: 100%;
    border-collapse: collapse;
}

.calendar-table th {
    height: 40px;
    font-size: 0.9em;
    color: #333;
    font-weight: 500;
    text-align: center;
}

.calendar-table td {
    text-align: center;
    padding: 10px 0;
    font-size: 1.1em;
    height: 50px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.calendar-table .sun {
    color: #E53935;
}

.calendar-table .sat {
    color: #1E88E5;
}

/* 오늘 날짜 강조 스타일 */
.calendar-table .today span {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
    border-radius: 50%;
    display: inline-block;
    width: 35px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    padding: 0;
}

.calendar-table .prev-month,
.calendar-table .next-month {
    color: #ccc;
    cursor: default;
}
</style>
</head>
<body>

<div class="calendar-container">
    <div class="calendar-header">
        <button id="prevMonthBtn" class="nav-btn">&lt;</button>
        <span class="month-year" id="currentMonthYear"></span>
        <button id="nextMonthBtn" class="nav-btn">&gt;</button>
    </div>
    
    <table class="calendar-table">
        <thead>
            <tr>
                <th class="sun">일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th class="sat">토</th>
            </tr>
        </thead>
        <tbody id="calendarBody">
            </tbody>
    </table>
</div>