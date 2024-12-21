document.addEventListener("DOMContentLoaded", () => {
  // 科目ごとの単元リスト
  const sectionsBySubject = {
    "数学": ["二次関数", "微分", "積分"],
    "化学": ["酸化還元", "電気分解", "高分子"],
    "物理": ["力学", "電磁気学", "熱力学"],
    "英語": ["文法", "長文読解", "リスニング"]
  };

  const subjectSelect = document.getElementById("subject-select");
  const sectionSelect = document.getElementById("section-select");

  // 科目選択時のイベントハンドラ
  subjectSelect.addEventListener("change", () => {
    const selectedSubject = subjectSelect.value;

    // 単元選択肢をリセット
    sectionSelect.innerHTML = "";

    if (sectionsBySubject[selectedSubject]) {
      // 新しい選択肢を追加
      sectionsBySubject[selectedSubject].forEach((section) => {
        const option = document.createElement("option");
        option.value = section;
        option.textContent = section;
        sectionSelect.appendChild(option);
      });
    } else {
      // 未選択状態の場合、空の選択肢を追加
      const blankOption = document.createElement("option");
      blankOption.value = "";
      blankOption.textContent = "選択して下さい";
      sectionSelect.appendChild(blankOption);
    }
  });
});
