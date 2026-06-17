// app/javascript/packs/study_chart.js
import Chart from 'chart.js/auto';

document.addEventListener('DOMContentLoaded', function () {
  const chartData = JSON.parse(document.getElementById('chart-data').dataset.chart);

  const labels = chartData.map(record => record.subject);  // 科目名をラベルに
  const data = chartData.map(record => record.time);  // 勉強時間をデータに

  const ctx = document.getElementById('studyChart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',  // 棒グラフ
    data: {
      labels: labels,
      datasets: [{
        label: '勉強時間 (分)',
        data: data,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',  // 背景色
        borderColor: 'rgba(75, 192, 192, 1)',  // 枠線の色
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
});
