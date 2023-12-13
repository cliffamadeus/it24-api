fetch('data.json')
    .then(response => response.json())
    .then(data => {
    //List
      // Handle the data and create a list
      const studentListContainer = document.getElementById('studentList');

      // Loop through the data and create list items
      data.forEach(student => {
        const listItem = document.createElement('p');
        listItem.textContent = `
            ${student.student_name} - ${student.student_program}
        `; // Concatenate name and program
        studentListContainer.appendChild(listItem);
      }); 

    //Search
    const studentSearchBar = document.getElementById('studentSearchBar');
    const studentSearchListContainer = document.getElementById('studentSearchList');

    function filterStudents(query) {
        const filteredStudents = data.filter(student => {
          const fullName = `
          ${student.student_name} ${student.student_program}
          `;
          return fullName.toLowerCase().includes(query.toLowerCase());
        });

        // Clear the existing list
        studentSearchListContainer.innerHTML = '';

        // Display the filtered students
        filteredStudents.forEach(student => {
          const listItem = document.createElement('p');
          listItem.textContent = `
          ${student.student_name} - ${student.student_program}
          `;
          studentSearchListContainer.appendChild(listItem);
        });
      }
      // Initial rendering of all students
      data.forEach(student => {
        const listItem = document.createElement('p');
        listItem.textContent = `
        ${student.student_name} - ${student.student_program}`;
        studentSearchListContainer.appendChild(listItem);
      });

      // Add event listener for input changes
      studentSearchBar.addEventListener('input', function() {
        filterStudents(studentSearchBar.value);
      });

    //View Details
    })

  
    
.catch(error => {
console.error('Error fetching data:', error);
});