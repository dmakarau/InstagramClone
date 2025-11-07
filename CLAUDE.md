# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an iOS Instagram clone tutorial project built with SwiftUI, targeting iOS 18.5+ with Swift 5.0. The app follows a traditional iOS app structure with a tab-based navigation system mimicking Instagram's core features.

## Development Commands

### Building and Running
- Open `InstagramCloneTutorial.xcodeproj` in Xcode to build and run the project
- The project uses Xcode 16.4+ and requires iOS 18.5+ deployment target
- Uses Firebase SDK with Swift Package Manager for backend integration

### Project Configuration
- Bundle ID: `com.makarau.denis.InstagramCloneTutorial`
- Development Team: `68S25WP33D`
- Swift version: 5.0
- Supports iPhone and iPad (device families 1,2)

## Architecture

### App Structure
The app follows a hierarchical SwiftUI architecture:
- `InstagramCloneTutorialApp.swift` - Main app entry point
- `ContentView.swift` - Root content view that displays MainTabView
- `MainTabView.swift` - Tab-based navigation with 5 tabs (Feed, Search, Upload, Notifications, Profile)

### Core Modules
The `Core/` directory contains feature-specific modules:

- **Authentication**: Fully functional login/registration with Firebase Auth integration via `AuthService`
- **Feed**: Main timeline displaying posts fetched from Firebase with user data linkage via `FeedViewModel` and interactive like/unlike functionality via `FeedCellViewModel`
- **Comments**: Complete commenting system with real-time posting, fetching, and optimistic UI updates via `CommentViewModel` and `CommentService`
- **Search**: User search and discovery with Firebase data fetching capabilities
- **Profile**: User profiles with real-time stats (posts/followers/following), post grids, bio information, edit profile functionality, and follow/unfollow capabilities via `ProfileViewModel`
- **UploadPosts**: Complete photo selection and post upload to Firebase Storage and Firestore
- **TabBar**: Main navigation container
- **Components**: Reusable UI components including `CircularProfileImageView` with Firebase image loading, `UserListView` with `UserListViewModel` for displaying followers/following lists

### Data Models
- `User.swift`: Firebase-integrated User model with Codable conformance, authentication state tracking, follow status (`isFollowed`), user stats (`UserStats` struct with followers/following/posts counts), and mock data for development
- `Post.swift`: Firebase-integrated Post model with Codable conformance, user relationship linking, Firebase Timestamp integration, and like tracking capabilities
- `Comment.swift`: Firebase-integrated Comment model with Codable conformance, user relationship linking, and timestamp support
- `UserListConfig.swift`: Configuration enum for different user list contexts (followers, following, likes, explore) with navigation titles

### Key Patterns
- Uses `@Observable` macro (iOS 17+ Observation framework) for all ViewModels and Services - **NO Combine framework**
- Follows MVVM architecture with Firebase integration (FeedViewModel, FeedCellViewModel, ProfileViewModel, EditProfileViewModel, UploadPostViewModel, CommentViewModel, SearchViewModel, UserListViewModel)
- Views use `@State` for ViewModel ownership (replaces `@StateObject` from old Combine pattern)
- `@Bindable` property wrapper enables two-way binding with `@Observable` objects
- Service layer architecture with dedicated `@Observable` services (`AuthService`, `UserService`, `PostService`, `CommentService`, `ImageUploader`)
- Singleton pattern for shared state (`AuthService.shared`, `UserService.shared`)
- Centralized user state management via `UserService.shared.currentUser`
- Async/await pattern with `@MainActor` for Firebase operations throughout the app
- Optimistic UI updates for improved user experience (comments, likes)
- NavigationStack for iOS 16+ navigation patterns
- PhotosPicker integration for image selection and Firebase Storage upload

### Asset Management
All images are stored in `Assets.xcassets` including app icons, brand assets (Instagram/Facebook logos), and character images (batman, spiderman, etc.) used as profile pictures and posts.

### Services Layer
The `Services/` directory contains Firebase integration services:

- **AuthService**: Singleton `@Observable` class managing user authentication, registration, login, logout, and session state with `var userSession: FirebaseAuth.User?`
- **UserService**: Singleton `@Observable` class managing centralized user state with `var currentUser: User?` property and methods for fetching user data from Firestore (`fetchUser`, `fetchAllUsers`, `fetchCurrentUser`, `fetchUsers(forConfig:)`). Includes static methods for follow/unfollow operations (`follow`, `unfollow`, `checkIfUserIsFollowed`) and fetching user statistics (`fetchUserStats`) that return following/followers/posts counts
- **PostService**: Static methods for fetching posts with linked user data from Firestore, like/unlike operations, and user like status checking. Uses `FirebaseConstants` for collection references.
- **CommentService**: Service for uploading and fetching comments from Firestore with timestamp support. Uses `FirebaseConstants` for collection references.
- **ImageUploader**: Static utility for uploading images to Firebase Storage with UUID-based file naming

### Utils Layer
The `Utils/` directory contains utility classes and constants:

- **FirebaseConstants**: Centralized Firestore collection references (`UsersCollection`, `PostsCollection`, `FollowingCollection`, `FollowersCollection`) to eliminate hardcoded collection paths and improve maintainability

### Extensions
The `Extension/` directory contains Swift extensions:

- **Timestamp**: Extension on Firebase `Timestamp` type providing `timestampString()` method for human-readable relative time formatting (e.g., "5m", "2h", "3d")

### Current Implementation Status
- **Authentication**: Fully functional with Firebase Auth integration (login, registration, logout, session management)
- **Feed**: Dynamic feed displaying posts fetched from Firebase Firestore with linked user profiles, interactive like/unlike functionality, and optimistic UI updates
- **Comments**: Complete commenting system with real-time posting, fetching, optimistic UI updates, and user data pre-population
- **Profile**: Complete profile functionality with edit capabilities, Firebase data sync, real-time user stats (posts/followers/following counts), and ProfileViewModel for managing profile state
- **Follow/Unfollow**: Full follow/unfollow system with Firebase relationship tracking via dedicated collections, optimistic UI updates, follow status checking, and interactive user lists (followers/following) via UserListView and UserListConfig
- **Upload**: Fully implemented post creation with image upload to Firebase Storage and metadata to Firestore
- **Search**: User discovery with Firebase data integration
- **Image Loading**: Firebase Storage integration for profile images and post images
- **State Management**: Centralized user state via singleton `@Observable` services with `@State` in views (no Combine)
- **Modern Swift Patterns**: 100% iOS 17+ `@Observable` architecture with `@State`, `@Bindable`, and `@MainActor`

### Backend Integration
- **Firebase Authentication**: Complete user authentication system
- **Firebase Firestore**: User profiles, posts, and user relationship storage (following/followers) with real-time capabilities
- **Firebase Storage**: Image hosting for profile pictures and post images
- **Data Synchronization**: Real-time data fetching, user-post relationship management, and follow/unfollow operations with optimistic updates
- **User Relationships**: Dedicated subcollections for tracking followers and following relationships (`following/{uid}/user-following` and `followers/{uid}/user-followers`)

### Development Notes
- Project has transitioned from mock data to full Firebase backend integration
- Authentication flows are fully functional with proper error handling
- Network layer implemented using Firebase SDK with async/await patterns and `@MainActor`
- **Modern Architecture**: Fully migrated to iOS 17+ `@Observable` pattern (removed all Combine dependencies)
- All ViewModels use `@Observable` instead of `ObservableObject`
- All Views use `@State` instead of `@StateObject`
- `@Bindable` used for two-way binding with text fields and form inputs
- Mock data still available for development and SwiftUI previews
- **Firebase Constants**: Centralized Firestore collection references in `FirebaseConstants` struct for better maintainability (includes `FollowingCollection` and `FollowersCollection`)
- **Timestamp Formatting**: Relative time display for posts and comments using Firebase `Timestamp` extension
- **User Relationships Architecture**: Follow/unfollow operations update both following and followers subcollections simultaneously using async/await with parallel writes. User stats are fetched by aggregating counts from these subcollections plus posts count.
- **ProfileViewModel**: New ViewModel managing profile-specific state including follow/unfollow operations with optimistic updates and user stats fetching with caching logic
