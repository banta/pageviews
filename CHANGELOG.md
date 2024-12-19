# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),  
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [8.0.0] - 2024-12-19

### Added
- Added a new template for model `Pageview` to the gem.
- Added a new generator for model `Pageview` to the gem.

### Changed
- Updated version number to `8.0.0` to match Rails release.
- Updated gem to Rails 8 standards for compatibility.
- Update bot identification to work with Rails 8.

## [0.2.1] - 2024-12-19

### Added
- Moved away from timestamped migrations to versioned migrations.

### Changed
- Upgraded `sqlite3` dependency to `~> 2.1` for compatibility with modern versions of ActiveRecord.

## [0.2.0] - 2024-12-19

### Added
- Initial fork and updates to the gem.

### Changed
- Upgraded `sqlite3` dependency to `~> 2.1` for compatibility with modern versions of ActiveRecord.
- Updated `rails` dependency to `~> 8.0` for compatibility with modern versions of Rails.
- Updated `ruby` dependency to `>= 3.0` for compatibility with modern versions of Ruby.'
- Updated development dependencies (`rspec`, `rake`, `bundler`).

### Fixed
- Resolved issues with database connection setup in tests.
- Fixed compatibility issues with the latest version of Bundler.

---

## [0.1.0] - 2024-04-27

### Added
- Basic functionality for logging Rails page views.
- Initial implementation of `acts_as_pageviews` for ActiveRecord models.

---

## How to Release a New Version

1. Update the version number in `lib/pageviews/version.rb`.
2. Add an entry in this `CHANGELOG.md` under `[Unreleased]`.
3. When ready to release, update `[Unreleased]` to the new version number and date.
4. Commit the changes and tag the release:

   ```bash
   git commit -am "Release v0.2.0"
   git tag v0.2.0
   git push origin main --tags