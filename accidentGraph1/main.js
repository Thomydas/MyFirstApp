/* eslint-disable prettier/prettier */

//#region Gaph avec API
// Charger les données de l'API
function loadData() {
    fetch("http://localhost:3000/accident")
        .then((res) => res.json())
        .then((data) => {
            console.log(data)
            accidentChart1Display(data);
        }
    ).catch((err) => console.error('Error fetching data:', err));
}
    
function accidentChart1Display(data) {

    const labels = data.map(row => row.luminosity);
    const dataset = data.map(row => row.count);

    new Chart(document.getElementById("accidentGraph1"), {
        type: 'bar',
        data: {
          labels: labels,
        datasets: [{
            label: 'Accident by luminosity',
            data: dataset,
        }]
        },
        options: {
            scales: {
            y: {
                beginAtZero: true,
                title: {
                display: true,
                text: 'Nombre d\'accidents'
                }
            },
            x: {
                title: {
                display: true,
                text: 'Luminosité'
                }
            }
            },
            plugins: { title: {
                display: true,
                text: 'Nombre d\'accidents par luminosité'
            }}
        }
    });
}
// Charger les données et afficher le graphique
loadData();
        
//#endregion

//#region Graph sans API
// function accidentChart1Display() {

//   const data = [
//     {
//       "luminosity": "Crépuscule ou aube",
//       "count": 49140
//     },
//     {
//       "luminosity": "Nuit avec éclairage public allumé",
//       "count": 141279
//     },
//     {
//       "luminosity": "Nuit avec éclairage public non allumé",
//       "count": 6894
//     },
//     {
//       "luminosity": "Nuit sans éclaireage public",
//       "count": 65811
//     },
//     {
//       "luminosity": "Plein jour",
//       "count": 576861
//     }];

//     new Chart(document.getElementById("accidentGraph1"), {
//         type: 'bar',
//         data: {
//             labels: data.map(row => row.luminosity),
//           datasets: [
//             {
//               label: 'Accident by luminosity',
//               data: data.map(row => row.count)
//             }
//           ]
//         },
//         options: {
//             scales: {
//               y: {
//                 beginAtZero: true,
//                 title: {
//                   display: true,
//                   text: 'Nombre d\'accidents'
//                 }
//               },
//               x: {
//                 title: {
//                   display: true,
//                   text: 'Luminosité'
//                 }
//               }
//             },
//             plugins: {
//               title: {
//                 display: true,
//                 text: 'Nombre d\'accidents par luminosité'
//               }
//             }
//           }
//         });
//     }

// // Charger les données et afficher le graphique
// accidentChart1Display();
//#endregion