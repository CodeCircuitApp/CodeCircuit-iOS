# CodeCircuit iOS App

An app for browsing all kinds of tech related events. Data is fetched from a remote HTTP server and cached in device's local storage. In case of a network error, an alert is dispatched and cached data is displayed. The event list implements endless scrolling. Events can also be browsed using a map. Tapping on an event marker on the map redirects to the event view.

### Image Caching

A custom view called ```CachedView``` has been implemented, along with a ```CachedImageManager``` and ```ImageCache``` singleton. Every downloaded image is cached in Foundation's ```NSCache``` collection. ```ImageCache``` has a maximum count limit of 100 and maximum total size limit of 50MB. 

### Saving to calendar

Every event can be saved to calendar using ```EKEventEditViewController()```. Upon clicking **Save** button, a event edit view controller is presented modally, allowing users to save an event to a calendar of their choice. Created event contains related information such as description, location and website URL. 

## Screenshots

<p>
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-13%20at%2021.07.59.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-13%20at%2021.08.45.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-13%20at%2021.08.58.png" width="200" />
</p>
<p>
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-12%20at%2000.02.36.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-12%20at%2000.02.48.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-12%20at%2000.03.17.png" width="200" />
</p>
<p>
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-11%20at%2023.43.58.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-11%20at%2023.47.43.png" width="200" />
  <img src="https://raw.githubusercontent.com/jmalinkiewicz/images/refs/heads/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-06-11%20at%2023.48.24.png" width="200" />
</p>
