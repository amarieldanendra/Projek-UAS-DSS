

const api_apotek_url = "https://opendata.sumedangkab.go.id/index.php/api/61497246b57e6";
const api_penduduk_url = "https://opendata.sumedangkab.go.id/index.php/api/61493671239d6";
const api_jasakesehatan_url = "https://opendata.sumedangkab.go.id/index.php/api/614a94fe6f021";

// ===============================
//          FETCH DATA
// ===============================
async function fetchData(url) {
  try {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  } catch (err) {
    console.log("failed fetching data" + err);
  }
}

// ===============================
//       ALGORITMA TOPSIS
// ===============================
async function topsis() {
  const dataApotek = await fetchData(api_apotek_url);
  const dataPenduduk = await fetchData(api_penduduk_url);
  const dataJasa = await fetchData(api_jasakesehatan_url);
  let selectedKecamatan = filter();

//   BELOM
  const bobot = {
    apotek: 2,
    penduduk: 5,
    usahaKecil: 2,
    usahaMenengah: 3,
    usahaMikro : 1,
  };

  const statusKriteria = {
    apotek: "cost",
    penduduk: "benefit",
    usahaKecil: "cost",
    usahaMenengah: "cost",
    usahaMikro : "cost",
  };

  let dataset = [];

  let pembagi = {
    apotek: 1,
    penduduk: 1,
    usahaKecil: 1,
    usahaMenengah: 1,
    usahaMikro : 1,
  };

//   ilangin koma
  for (let i = 1; i < dataJasa.length; i++) {
    let obj = {};
    obj.kecamatan = dataJasa[i][2];
    obj.apotek = dataApotek[i][3] * 1000;
    obj.usahaMikro = dataJasa[i][3] * 1;
    obj.usahaKecil = dataJasa[i][4] * 1;
    obj.usahaMenengah = dataJasa[i][5] * 1;
    obj.penduduk = dataPenduduk[i][4] * 1;
    dataset.push(obj);
  }

  let matrixNormalize = [...dataset];

  // HITUNG PEMBAGI
  dataset.forEach(function (datum) {
    pembagi.apotek += Math.pow(datum.apotek, 2);
    pembagi.penduduk += Math.pow(datum.penduduk, 2);
    pembagi.usahaMikro += Math.pow(datum.usahaMikro, 2);
    pembagi.usahaKecil += Math.pow(datum.usahaKecil, 2);
    pembagi.usahaMenengah += Math.pow(datum.usahaMenengah, 2);
  });
  Object.keys(pembagi).forEach(function (key) {
    pembagi[key] = Math.sqrt(pembagi[key]);
  });

  // HITUNG MATRIX TERNORMALISASI
  for (let i = 0; i < dataset.length; i++) {
    matrixNormalize[i].apotek = dataset[i].apotek / pembagi.apotek;
    matrixNormalize[i].usahaMikro = dataset[i].usahaMikro / pembagi.usahaMikro;
    matrixNormalize[i].usahaKecil = dataset[i].usahaKecil / pembagi.usahaKecil;
    matrixNormalize[i].usahaMenengah = dataset[i].usahaMenengah / pembagi.usahaMenengah;
    matrixNormalize[i].penduduk = dataset[i].penduduk / pembagi.penduduk;
    }

  // HITUNG MATRIX TERNORMALISASI TERBOBOT
  let matrixTerbobot = [...matrixNormalize];
  for (let i = 0; i < dataset.length; i++) {
    matrixTerbobot[i].apotek = matrixNormalize[i].apotek * bobot.apotek;
    matrixTerbobot[i].usahaMikro = matrixNormalize[i].usahaMikro * bobot.usahaMikro;
    matrixTerbobot[i].usahaKecil = matrixNormalize[i].usahaKecil * bobot.usahaKecil;
    matrixTerbobot[i].usahaMenengah = matrixNormalize[i].usahaMenengah * bobot.usahaMenengah;
    matrixTerbobot[i].penduduk = matrixNormalize[i].penduduk * bobot.penduduk;
    }

  let aPlus = {
    apotek: 1,
    penduduk: 1,
    usahaMikro: 1,
    usahaKecil: 1,
    usahaMenengah: 1,
  };

  let aMinus = {
    apotek: 1,
    penduduk: 1,
    usahaMikro: 1,
    usahaKecil: 1,
    usahaMenengah: 1,
  };

  aPlus.apotek = statusKriteria.apotek == "benefit" ? findMax(matrixTerbobot, "apotek") : findMin(matrixTerbobot, "apotek");
  aPlus.penduduk = statusKriteria.penduduk == "benefit" ? findMax(matrixTerbobot, "penduduk") : findMin(matrixTerbobot, "penduduk");
  aPlus.usahaMikro = statusKriteria.usahaMikro == "benefit" ? findMax(matrixTerbobot, "usahaMikro") : findMin(matrixTerbobot, "usahaMikro");
  aPlus.usahaKecil = statusKriteria.usahaKecil == "benefit" ? findMax(matrixTerbobot, "usahaKecil") : findMin(matrixTerbobot, "usahaKecil");
  aPlus.usahaMenengah = statusKriteria.usahaMenengah == "benefit" ? findMax(matrixTerbobot, "usahaMenengah") : findMin(matrixTerbobot, "usahaMenengah");

  aMinus.apotek = statusKriteria.apotek == "cost" ? findMax(matrixTerbobot, "apotek") : findMin(matrixTerbobot, "apotek");
  aMinus.penduduk = statusKriteria.penduduk == "cost" ? findMax(matrixTerbobot, "penduduk") : findMin(matrixTerbobot, "penduduk");
  aMinus.usahaMikro = statusKriteria.usahaMikro == "cost" ? findMax(matrixTerbobot, "usahaMikro") : findMin(matrixTerbobot, "usahaMikro");
  aMinus.usahaKecil = statusKriteria.usahaKecil == "cost" ? findMax(matrixTerbobot, "usahaKecil") : findMin(matrixTerbobot, "usahaKecil");
  aMinus.usahaMenengah = statusKriteria.usahaMenengah == "cost" ? findMax(matrixTerbobot, "usahaMenengah") : findMin(matrixTerbobot, "usahaMenengah");

  // =========================
  //    DISTANCE D+ AND D-
  // =========================
  let sepMeasure = [];

  for (let i = 0; i < matrixTerbobot.length; i++) {
    let obj = {};
    obj.kecamatan = matrixTerbobot[i].kecamatan;
    obj.dPlus =
      Math.pow(aPlus.apotek - matrixTerbobot[i].apotek, 2) +
      Math.pow(aPlus.penduduk - matrixTerbobot[i].penduduk, 2) +
      Math.pow(aPlus.usahaMikro - matrixTerbobot[i].usahaMikro, 2) +
      Math.pow(aPlus.usahaKecil - matrixTerbobot[i].usahaKecil, 2) +
      Math.pow(aPlus.usahaMenengah - matrixTerbobot[i].usahaMenengah, 2);

    obj.dMinus =
      Math.pow(aMinus.apotek - matrixTerbobot[i].apotek, 2) +
      Math.pow(aMinus.penduduk - matrixTerbobot[i].penduduk, 2) +
      Math.pow(aMinus.usahaMikro - matrixTerbobot[i].usahaMikro, 2) +
      Math.pow(aMinus.usahaKecil - matrixTerbobot[i].usahaKecil, 2) +
      Math.pow(aMinus.usahaMenengah - matrixTerbobot[i].usahaMenengah, 2);

    obj.dPlus = Math.sqrt(obj.dPlus);
    obj.dMinus = Math.sqrt(obj.dMinus);
    sepMeasure.push(obj);
  }

  // console.log(sepMeasure);
  // console.log(sepMeasure[0].dPlus);

  // =========================
  //        PREFERENCE
  // =========================
  let preference = [];
  for (let i = 0; i < matrixTerbobot.length; i++) {
    let obj = {};
    obj.kecamatan = matrixTerbobot[i].kecamatan;
    obj.preference = sepMeasure[i].dMinus / (sepMeasure[i].dPlus + sepMeasure[i].dMinus);
    preference.push(obj);
  }
  // console.log(preference)

  // =========================
  //          RANK
  // =========================
  preference.sort((i, j) => {
    return j.preference - i.preference;
  });
  // console.log(preference);

  // for (let i = 0; i < matrixTerbobot.length; i++) {
  //   console.log(preference[i].kecamatan);
  //   console.log(preference[i].preference);

  // }

  // ================================================
  //         CONSOLE LOG KECAMATAN TERFILTER
  // ================================================
  const rankList = document.querySelector("#hasil .list-group");

  // Reset Child setiap klik tombol
  while (rankList.firstChild) {
    rankList.removeChild(rankList.firstChild);
  }

  rankItems = "";
  for (let i = 0; i < preference.length; i++) {
    if (selectedKecamatan.includes(preference[i].kecamatan.toLowerCase())) {
      rankList
        .appendChild(
          Object.assign(document.createElement("li"), {
            innerHTML: preference[i].kecamatan,
            className: "list-group-item d-flex justify-content-between align-items-center",
          })
        )
        .appendChild(
          Object.assign(document.createElement("span"), {
            innerHTML: preference[i].preference,
            className: "badge bg-primary rounded-pill",
          })
        );
      console.log(preference[i]);
    }
  }
}

// =====================================
//         IDEAL POSITIF (A+)
// =====================================
function findMax(matrix, key) {
  let tempArray = [];
  for (let i = 0; i < matrix.length; i++) {
    tempArray.push(matrix[i][key]);
  }
  return Math.max(...tempArray);
}

// =====================================
//          IDEAL NEGATIF (A-)
// =====================================
function findMin(matrix, key) {
  let tempArray = [];
  for (let i = 0; i < matrix.length; i++) {
    tempArray.push(matrix[i][key]);
  }
  return Math.min(...tempArray);
}

// RUN TOPSIS
// topsis()

function filter() {
  let inputKecamatan = document.querySelectorAll('input[name="kecamatan"]');
  let selectedKecamatan = [];
  inputKecamatan.forEach(function (datum) {
    if (datum.checked) {
      selectedKecamatan.push(datum.value);
    }
  });
  return selectedKecamatan;
}

function showRank(data) { }

function removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
}