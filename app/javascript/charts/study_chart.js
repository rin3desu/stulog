console.log('study_chart.js is loaded'); // study_chart.jsが読み込まれているか確認

document.addEventListener('DOMContentLoaded', () => {
  const chartDataDiv = document.getElementById('chart-data');
  if (!chartDataDiv) return; // データが存在しない場合は終了

  const chartData = JSON.parse(chartDataDiv.dataset.chart);

  const labels = chartData.map(data => data.subject);
  const data = chartData.map(data => data.time);

  const ctx = document.getElementById('studyChart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: '勉強時間 (分)',
        data: data,
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
        ],
        borderWidth: 1,
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
