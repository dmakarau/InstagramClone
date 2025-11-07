# Instagram Clone - SwiftUI

A comprehensive iOS Instagram clone built with SwiftUI. This project explores modern iOS development patterns, Firebase integration, and contemporary app architecture while building a fully functional social media app.

## Technologies & Frameworks

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://img.shields.io/badge/SwiftUI-000000?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI">
        <br><b>SwiftUI</b>
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase">
        <br><b>Firebase</b>
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
        <br><b>iOS 17+</b>
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
        <br><b>Swift 5.9+</b>
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white" alt="Xcode">
        <br><b>Xcode 16+</b>
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/MVVM-4CAF50?style=for-the-badge&logo=architecture&logoColor=white" alt="MVVM">
        <br><b>MVVM</b>
      </td>
    </tr>
  </table>
</div>

**Core Technologies:**
- **SwiftUI** - Declarative UI framework with iOS 17+ Observable architecture
- **Firebase** - Authentication, Firestore database, and Storage (SDK 12.1.0+)
- **Swift Concurrency** - Async/await patterns with MainActor
- **Observation Framework** - Modern reactive programming (replaces Combine)
- **PhotosPicker** - Native photo selection for iOS

## App Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="Screenshots/login-screen.png" width="200" alt="Login Screen">
        <br><b>Login Screen</b>
      </td>
      <td align="center">
        <img src="Screenshots/feed-screen.png" width="200" alt="Feed Screen">
        <br><b>Feed Screen</b>
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="Screenshots/search-screen.png" width="200" alt="Search Screen">
        <br><b>Search & Discovery</b>
      </td>
      <td align="center">
        <img src="Screenshots/profile-screen.png" width="200" alt="Profile Screen">
        <br><b>User Profile</b>
      </td>
    </tr>
  </table>
</div>

## Project Overview

This Instagram clone demonstrates modern iOS development through practical implementation. The app includes all the core features you'd expect from a social media platform - user authentication, real-time feeds, commenting, notifications, and user relationships.

The project focuses on:
- SwiftUI Framework for modern declarative UI development
- Firebase Integration for authentication, database, and cloud storage
- Real-time data synchronization using async/await patterns
- MVVM architecture with the new Observation framework
- Modern iOS features like PhotosPicker and NavigationStack

## Architecture & Design Patterns

The app follows a clean MVVM architecture using SwiftUI and the new iOS 17+ Observation framework. Here's how it's structured:

**SwiftUI + MVVM Architecture**
- View Layer: SwiftUI views with declarative UI components using State and Bindable
- ViewModel Layer: Observable classes using iOS 17+ Observation framework (no Combine needed)
- Service Layer: Singleton Observable services for Firebase operations and data management
- Model Layer: Codable data models that work seamlessly with Firebase

**Technology Stack**
- SwiftUI for the entire user interface
- Firebase SDK 12.1.0 for backend services (Auth, Firestore, Storage)
- iOS 17+ Observation framework for reactive data binding
- PhotosPicker for native photo selection
- Async/Await for modern Swift concurrency

## What's Implemented

This isn't just a basic clone - it's a fully functional social media app with all the features you'd expect:

**User Authentication & Profiles**
Complete user system with email/password registration, multi-step onboarding, and profile management. Users can upload profile pictures, edit their information, and view detailed statistics about their activity.

**Social Features**
Full follow/unfollow system with real-time updates. Users can see their followers and following lists, discover new users through search, and view other profiles with complete post grids.

**Posts & Feed**
Instagram-style feed with real-time loading, photo uploading via PhotosPicker, and complete interaction system. Users can like, unlike, and comment on posts with optimistic UI updates for smooth performance.

**Real-time Notifications**
Comprehensive notification system that alerts users when someone likes their posts, comments, or follows them. Notifications are delivered in real-time with proper Firebase security rules.

**Comments System**
Full commenting functionality with real-time updates. Comments appear instantly with optimistic UI while syncing to Firebase in the background.

**Search & Discovery**
Real-time user search with live filtering and responsive results. The app includes some fun character profiles (Marvel characters) for demonstration purposes.

## App Structure

```
InstagramCloneTutorial/
├── App/
│   └── InstagramCloneTutorialApp.swift           # App entry point with Firebase configuration
├── Core/
│   ├── Authentication/                           # Complete authentication system
│   │   ├── Service/AuthService.swift             # Firebase Auth integration
│   │   ├── ViewModel/                            # LoginViewModel, RegistrationViewModel
│   │   └── View/                                # Login, Registration flow screens
│   ├── Feed/                                    # Main timeline functionality
│   │   ├── View/FeedView.swift, FeedCell.swift  # Feed UI components
│   │   └── ViewModel/FeedViewModel.swift         # Feed data management
│   ├── Comments/                                # Comments system
│   │   ├── Model/Comment.swift                  # Comment data model
│   │   ├── Service/CommentService.swift         # Firebase comment operations
│   │   ├── View/CommentsView.swift, CommentsCell.swift  # Comment UI components
│   │   └── ViewModel/CommentViewModel.swift      # Comment data management
│   ├── Notifications/                           # Real-time notifications system
│   │   ├── Model/                               # IGNotification.swift, IGNotificationType.swift
│   │   ├── Service/NotificationsService.swift   # Firebase notification operations
│   │   ├── Manager/NotificationManager.swift    # Centralized notification management
│   │   ├── View/                                # NotificationsView.swift, NotificationsCell.swift
│   │   └── ViewModel/IGNotificationsViewModel.swift  # Notification data management
│   ├── Search/                                  # User discovery system
│   │   ├── View/SearchView.swift                # Search interface
│   │   └── ViewModel/SearchViewModel.swift       # Search functionality
│   ├── Profile/                                 # Complete profile system
│   │   ├── View/                                # ProfileView, EditProfileView, ProfileHeaderView, etc.
│   │   └── ViewModel/
│   │       ├── EditProfileViewModel.swift       # Profile editing logic
│   │       └── ProfileViewModel.swift           # Profile data, follow/unfollow, stats management
│   ├── UploadPosts/                             # Post creation system
│   │   ├── View/UploadPostView.swift            # Post upload interface
│   │   └── ViewModel/UploadPostViewModel.swift   # Upload functionality
│   ├── Components/                              # Reusable UI components
│   │   ├── View/CircularProfileImageView.swift  # Profile image component
│   │   ├── View/PostGridView.swift              # Post grid display
│   │   ├── View/UserStatView.swift              # User statistics display
│   │   ├── View/UserListView.swift              # User list component for followers/following
│   │   ├── ViewModel/PostGridViewModel.swift     # Grid data management
│   │   └── ViewModel/UserListViewModel.swift     # User list data management
│   ├── TabBar/MainTabView.swift                 # Main navigation container
│   └── Root/                                    # App root management
│       ├── View/ContentView.swift               # Root content view
│       └── ViewModel/ContentViewModel.swift      # App state management
├── Model/
│   ├── User.swift                               # User data model with Firebase integration, follow status, and stats
│   ├── Post.swift                               # Post data model with user linking
│   └── UserListConfig.swift                     # Configuration enum for different user list contexts
├── Services/
│   ├── UserService.swift                        # Singleton service for user data, follow/unfollow, and stats
│   ├── PostService.swift                        # Post data operations
│   └── ImageUploader.swift                      # Firebase Storage image handling
├── Extension/
│   └── Timestamp.swift                          # Firebase Timestamp extension for relative time formatting
├── Utils/
│   └── Constants.swift                          # Firebase constants (users, posts, following, followers collections)
├── Assets.xcassets/                             # App icons and character images
└── Screenshots/                                 # App screenshot collection
```

## Technical Implementation

**Firebase Integration**
```swift
// Firebase constants for centralized collection references
struct FirebaseConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
    static let PostsCollection = Root.collection("posts")
    static let FollowingCollection = Root.collection("following")
    static let FollowersCollection = Root.collection("followers")
    static let NotificationsCollection = Root.collection("notifications")
    
    static func UserNotificationCollection(uid: String) -> CollectionReference {
        return NotificationsCollection.document(uid).collection("user-notifications")
    }
}

// Authentication with async/await
func createUser(email: String, password: String, username: String) async throws {
    let result = try await Auth.auth().createUser(withEmail: email, password: password)
    await uploadUserData(uid: result.user.uid, username: username, email: email)
}

// Firestore data operations with centralized constants
func fetchAllUsers() async throws -> [User] {
    let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
    return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
}

// Centralized user state management
UserService.shared.currentUser // Accessible throughout the app

// Follow/Unfollow operations
static func follow(uid: String) async throws {
    // Creates subcollections in both following and followers collections
}

static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
    // Checks if current user follows the target user
}

// Fetch user statistics
static func fetchUserStats(uid: String) async throws -> UserStats {
    // Returns following count, followers count, and posts count
}

// Relative timestamp formatting
extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}

// Notification system integration
class NotificationManager {
    static let shared = NotificationManager()
    private let service = NotificationsService()
    
    func uploadLikeNotification(to uid: String, post: Post) async throws {
        try await service.uploadNotification(toUid: uid, type: .like, post: post)
    }
    
    func uploadFollowNotification(to uid: String) async throws {
        try await service.uploadNotification(toUid: uid, type: .follow)
    }
    
    func deleteLikeNotification(notificationOwner: String, post: Post) async {
        // Automatically removes notification when user unlikes
    }
}

// Real-time notification fetching
func fetchNotifications() async throws -> [IGNotification] {
    let snapshot = try await FirebaseConstants
        .UserNotificationCollection(uid: currentUid)
        .order(by: "timestamp", descending: true)
        .getDocuments()
    
    return snapshot.documents.compactMap({ try? $0.data(as: IGNotification.self)})
}
```

**Modern SwiftUI Patterns (iOS 17+)**
```swift
// @Observable replaces ObservableObject + @Published
@Observable
class FeedViewModel {
    var posts = [Post]()

    func fetchPosts() async throws {
        // Modern async data loading
    }
}

// Views use @State instead of @StateObject
struct FeedView: View {
    @State private var viewModel = FeedViewModel()

    var body: some View {
        ForEach(viewModel.posts) { post in
            FeedCell(post: post)
        }
    }
}

// @Bindable enables two-way binding with @Observable
struct EditProfileView: View {
    @State private var viewModel: EditProfileViewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        TextField("Name", text: $viewModel.fullname)
    }
}
```

**Reactive State Management**
```swift
// Singleton @Observable services for centralized state
@Observable
class AuthService {
    var userSession: FirebaseAuth.User?
    static let shared = AuthService()
}

@Observable
class UserService {
    var currentUser: User?
    static let shared = UserService()
}

// Views automatically observe @Observable properties
struct ContentView: View {
    @State var viewModel = ContentViewModel()

    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else if let currentUser = viewModel.currentUser {
            MainTabView(user: currentUser)
        }
    }
}
```

## Getting Started

**What you'll need:**
- Xcode 16.4 or later
- iOS 18.5+ deployment target  
- A Firebase project (free to set up)

**Setup:**
1. Clone this repository
2. Open `InstagramCloneTutorial.xcodeproj` in Xcode
3. Set up Firebase:
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Download your `GoogleService-Info.plist` file and add it to the project root
   - Update the bundle ID to match your Firebase project
   - Enable Authentication and Firestore in the Firebase Console
4. Build and run

> **Important:** The `GoogleService-Info.plist` file is gitignored for security. You'll need to add your own Firebase configuration file.

**Firebase Setup:**
The app uses three Firebase services:
- FirebaseAuth for user authentication
- FirebaseFirestore for the database
- FirebaseStorage for image uploads

## What You'll Learn

Building this Instagram clone covers a lot of ground in modern iOS development:

- Modern iOS Development with SwiftUI and the new Observable framework
- Firebase Integration for real-time apps with authentication and database operations  
- Swift Concurrency using async/await patterns and MainActor for UI updates
- MVVM Architecture using Observable classes instead of Combine
- State Management with SwiftUI's State, Bindable, and Environment
- Real-world UI/UX patterns that feel native to iOS

## Current Status

This is a fully functional Instagram clone with all core features implemented. The app includes user authentication, profiles, posting, commenting, following, real-time notifications, and search functionality. Everything is built using modern iOS patterns and the latest SwiftUI features.

**What's working:**
Everything! The app is feature-complete with user auth, posts, comments, follows, notifications, and search.

**Future ideas:**
- Push notifications when the app is closed
- Stories functionality 
- Direct messaging
- Image filters and editing tools
- Better image caching and performance optimization

## Learning Resources

This project demonstrates concepts from modern iOS development, including SwiftUI patterns, Firebase integration, and Swift concurrency. It's a practical example of building a real-world social media app with contemporary tools and patterns.

---

*This project demonstrates modern iOS development patterns and is designed for educational purposes.*
