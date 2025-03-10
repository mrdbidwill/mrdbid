<?php

// Public Routes: Accessible by anyone (e.g., Home, About, Contact)
require __DIR__.'/public_routes.php';

// Guest-only Routes: Allows special access for unregistered users (e.g., specimens demo)
require __DIR__.'/guest_routes.php';

// User Routes: Authenticated users' functionality
require __DIR__.'/user_routes.php';

// Admin Routes: For admin-only privileged routes
require __DIR__.'/admin_routes.php';

// Lookup Routes: Data/lookups related (used across the app, requiring auth)
require __DIR__.'/lookup_routes.php';

// Test Routes: For testing/debugging (should not exist in production)
require __DIR__.'/test_routes.php';
