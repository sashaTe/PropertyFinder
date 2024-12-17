# Property Finder

A SwiftUI test assignment that demonstrates modern iOS development practices through a property browsing application.

## Requirements Implementation

### Property List Screen ✓
Required features implemented (see [PropertyList.swift](PropertyFinder/Presentation/Features/PropertyList/Views/PropertyList.swift)):
- Property listing with name, type, city and rating
- Thumbnail images with async loading and placeholders
- Toggle between list and map views
- Loading states and error handling

### Property Detail Screen ✓
Required features implemented (see [PropertyDetailView.swift](PropertyFinder/Presentation/Features/PropertyDetail/Views/PropertyDetailView.swift)):
- Full property information display
- Address details (address1, address2, city, country)
- Property description with "Read more" functionality
- Directions
- Image carousel
- Additional sections (Check-in, House Rules, Reviews, Location)

## Technical Implementation

### Architecture
### Architecture

The app follows Clean Architecture principles with MVVM pattern:

#### Presentation Layer
- **Views**: SwiftUI views responsible for UI rendering
  - PropertyList and PropertyDetail as main screens
  - Reusable components (ImageCarousel, MapView)
  - Sheet presentations for additional content

- **ViewModels**: Handle presentation logic and state management
  - Use @Published properties with ViewState pattern
  - Manage loading, error, and success states
  - Communicate with repositories through protocols

#### Domain Layer
- **Models**: Core business models
  - Property for list items
  - PropertyDetail for detailed information
  - Location for mapping functionality

- **Protocols**: Define contracts between layers
  - PropertyRepositoryProtocol for data access
  - NavigationCoordinator for navigation
  - DependencyContainerProtocol for DI

#### Infrastructure Layer
- **Navigation**: Centralized navigation system
  - DefaultNavigationCoordinator for managing navigation stack
  - AppRoute enum for type-safe routing
  - Sheet presentation coordination

- **Dependency Injection**: Container-based DI
  - Protocol-based dependency registration
  - Factory methods for ViewModels
  - Testability through protocol abstractions

#### Key Architectural Decisions:
1. **State Management**
   - ViewState enum for consistent state handling
   - Loading, error, empty, and loaded states
   - Type-safe data association

2. **Navigation**
   - Coordinator pattern implementation
   - Centralized navigation control
   - Type-safe routing with AppRoute

3. **Dependency Injection**
   - Protocol-based container
   - Easy testing through mocking
   - Clear dependency graph

4. **Testing Strategy**
   - Unit tests for ViewModels
   - Navigation testing
   - Mock repositories for data testing

## Technical Highlights
- SwiftUI for modern UI development
- Async/await for concurrency
- Dependency Injection for testability
- Protocol-oriented design
- MVVM architecture
- Comprehensive error handling
- Unit test coverage

