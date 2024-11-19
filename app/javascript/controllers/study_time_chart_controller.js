import { Controller } from "stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  connect() {
    console.log("StudyTimeChartController connected");
    const chartData = this.element.dataset.chartData;
    const parsedData = JSON.parse(chartData);
    const ctx = document.getElementById("study-time-chart").getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: parsedData.subjects,
        datasets: [{
          label: '勉強時間',
          data: parsedData.times,
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
