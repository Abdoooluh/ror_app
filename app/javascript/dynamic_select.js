const getElementByIds = (ids) =>{
  for (const id of ids) {
    const element = document.getElementById(id);
    if (element) {
      console.log(`found ${id}`)
      return element;
    }
  }
  return null; 
}

document.addEventListener('turbo:load', () => {
  
  const countrySelect = getElementByIds(['country_select', 'user_country_id', 'vendor_country_id'])
  const citySelect = getElementByIds(['city_select', ,'user_city_id', 'vendor_city_id']);
  
    if (countrySelect && citySelect) {

      countrySelect.addEventListener('change', () => {
        
        const countryId = countrySelect.value;
  
        if (countryId) {
  
          fetch(`/getCityDetails?country_id=${countryId}`)
            .then(response => response.json())
            .then(data => {
              
              citySelect.innerHTML = '';
  
              data.forEach(city => {
                const option = document.createElement('option');
                option.value = city.id;
                option.textContent = city.name;
                citySelect.appendChild(option);
              });

              citySelect.value = '';
  
              const promptOption = document.createElement('option');
              promptOption.value = '';
              promptOption.textContent = 'Select a city';
              citySelect.insertBefore(promptOption, citySelect.firstChild);
            })
            .catch(error => console.error('Error fetching cities:', error));

            
        } else {
          citySelect.innerHTML = '';
          const promptOption = document.createElement('option');
          promptOption.value = '';
          promptOption.textContent = 'Select a city';
          citySelect.appendChild(promptOption);
        }
      });
    }
  });
  