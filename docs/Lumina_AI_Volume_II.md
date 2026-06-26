# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 1
#
# Brand DNA
# Design Philosophy
# Visual Language
# Experience Principles
# ===================================================================

Version: 1.0

Status:
In Progress

Owner:
Ayushmaan Verma

---

# Table of Contents

1 Brand DNA

2 Product Personality

3 User Emotion

4 Design Philosophy

5 Experience Principles

6 Visual Language

7 Workspace Canvas Philosophy

8 Interface Architecture

9 Design Keywords

10 UI Goals

11 Things We Never Build

12 Premium Design Principles

---

# 1 Brand DNA

## Product Name

Lumina AI

---

## Product Category

AI Visual Workspace

NOT

AI Toolbox

NOT

AI Chatbot

NOT

AI Image Analyzer

Lumina AI is an intelligent workspace where visual content becomes interactive.

The application revolves around workspaces rather than tools.

---

## Brand Promise

See More.

Understand More.

Create Better.

---

## Brand Mission

Transform every uploaded image or document into an intelligent, persistent workspace where users can think, create, organize and collaborate with AI.

---

## Brand Vision

Become the most elegant cross-platform AI workspace built with Flutter.

The emphasis is not on adding the largest number of AI models.

The emphasis is on creating the highest-quality user experience.

---

# 2 Product Personality

If Lumina AI were a person:

Calm

Confident

Professional

Minimal

Helpful

Intelligent

Quiet

Elegant

Never loud.

Never playful.

Never childish.

Never overwhelming.

---

## Emotional Goals

When users open Lumina AI they should feel:

Focused

Organized

Creative

Curious

In control

Never confused.

Never distracted.

Never overloaded.

---

# 3 Design Philosophy

Everything begins with one belief.

Content is more important than controls.

The interface should disappear.

The workspace should remain.

Users should feel as though they are interacting directly with their content instead of interacting with software.

Every UI decision must reinforce this feeling.

---

# Design Statement

The interface exists only to support the user's thinking.

It should never compete for attention.

---

# Workspace First

Traditional software revolves around pages.

Lumina revolves around workspaces.

Traditional:

Screen

↓

Feature

↓

Result

Lumina:

Workspace

↓

Context

↓

AI

↓

Knowledge

↓

Continue Working

This philosophy influences navigation, layout and animations.

---

# 4 User Experience Principles

## Principle 1

Calm Interface

Every screen should feel peaceful.

White space is intentional.

Avoid visual clutter.

Never place too many buttons on one screen.

---

## Principle 2

Context over Navigation

Users should rarely navigate.

Instead they stay inside one workspace while AI capabilities change contextually.

Navigation is expensive.

Context switching is minimized.

---

## Principle 3

One Upload

Upload once.

Perform unlimited AI actions.

Never ask users to upload the same content twice.

---

## Principle 4

Progressive Disclosure

Only show advanced functionality when needed.

Beginners should not feel overwhelmed.

Power users should still have depth.

---

## Principle 5

Motion with Purpose

Animations communicate.

They do not decorate.

Every movement should explain what happened.

---

## Principle 6

Everything Feels Connected

Cards

Dialogs

Bottom Sheets

Navigation

Workspace

AI Panel

All belong to the same visual language.

Nothing feels isolated.

---

# 5 Visual Language

Lumina AI follows a

Calm Spatial Interface

instead of traditional Glassmorphism.

Glass is only one implementation detail.

The visual identity is defined by space, depth and clarity.

---

## Core Characteristics

Large spacing

Soft depth

Rounded geometry

Blurred translucent layers

Minimal borders

Floating panels

Gentle gradients

Elegant typography

Soft shadows

Subtle glow

Never excessive.

---

## Interface Density

Target Density

Low

The interface should breathe.

Avoid cramped layouts.

Users should instantly understand hierarchy.

---

# 6 Workspace Canvas Philosophy

The Workspace Canvas is the center of every interaction.

The canvas owns the screen.

Everything else supports it.

Layout hierarchy:

Workspace

↓

AI Context Panel

↓

Navigation

↓

Utilities

NOT

Navigation

↓

Buttons

↓

Workspace

---

# Canvas Rules

Maximum focus on content.

Minimum permanent controls.

Floating utilities.

Adaptive side panels.

Contextual actions.

Persistent history.

---

# 7 Information Hierarchy

Importance Order

1

Workspace

2

AI Results

3

Suggested Actions

4

Navigation

5

Settings

The user's content should always dominate the screen.

---

# 8 Design Keywords

Elegant

Quiet

Premium

Adaptive

Minimal

Spatial

Professional

Confident

Focused

Fluid

Responsive

Timeless

Every design decision should strengthen at least one of these keywords.

If it does not, reconsider it.

---

# 9 UI Goals

Goal 1

Users understand the interface in under five seconds.

---

Goal 2

Primary action visible immediately.

---

Goal 3

Navigation requires fewer than three taps.

---

Goal 4

Workspace occupies at least 65% of available space on desktop.

---

Goal 5

Every page follows identical spacing rules.

---

Goal 6

No screen appears empty.

Empty states remain beautiful.

---

# 10 Things We Never Build

Never use:

Material-looking cards

Default dialogs

Default snackbars

Crowded toolbars

Nested drawers

Tiny touch targets

Random colors

Heavy shadows

Flat gray backgrounds

Multiple floating buttons

Long settings pages

Duplicate actions

---

# 11 Premium Design Principles

Instead of

More buttons

↓

Better context

Instead of

More colors

↓

Better hierarchy

Instead of

More animations

↓

Meaningful motion

Instead of

More features

↓

Higher quality

Instead of

More pages

↓

Persistent workspaces

---

# Final Design Statement

Lumina AI should feel less like using an application and more like working inside a thoughtfully designed creative studio.

Every interaction should communicate calmness, confidence, precision and intelligence.

If a screen feels busy, noisy or conventional, it does not meet the Lumina standard.

# End of Volume II
# Part 1

Next:

Part 2

Design Tokens

• Color System
• Typography
• Spacing
• Grid
• Radius
• Elevation
• Shadows
• Blur
• Surface Hierarchy

This section will define every visual constant used throughout the application.

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 2
#
# Design Tokens
# Color System
# Typography
# Spacing
# Elevation
# Blur System
# Surface Hierarchy
# ===================================================================

Version: 1.0

Status:
Draft

---

# 12 Design Token Philosophy

Every visual property in Lumina AI must originate from a design token.

No widget may define its own:

• Colors

• Radius

• Padding

• Margin

• Blur

• Shadow

• Animation Duration

• Opacity

Everything must come from the Design System.

This guarantees consistency across Android, iOS, Desktop and Web.

---

# Design Token Naming Convention

Color

color.surface.primary

Spacing

space.24

Radius

radius.large

Blur

blur.glass.medium

Shadow

shadow.soft.large

Animation

motion.standard

Never use raw values inside widgets.

---

# 13 Color Philosophy

The interface is built from darkness instead of brightness.

Dark backgrounds increase focus.

Glass surfaces create depth.

Gradients guide attention.

Accent colors communicate action.

The background should disappear.

Content should stand out.

---

# Color Personality

Background

Calm

Glass

Elegant

Primary

Confident

Secondary

Helpful

Accent

Creative

Error

Clear

Success

Positive

Warning

Attentive

---

# 14 Color Palette

Primary

#7C3AED

Primary Hover

#8B5CF6

Primary Pressed

#6D28D9

---------------------------------

Secondary

#06B6D4

Secondary Hover

#0891B2

---------------------------------

Accent

#EC4899

---------------------------------

Success

#10B981

---------------------------------

Warning

#F59E0B

---------------------------------

Error

#EF4444

---------------------------------

Info

#3B82F6

---

# Background Layers

Background 0

#05070F

Background 1

#0A0F1A

Background 2

#101828

Background 3

#182230

Never use pure black.

---

# Glass Surfaces

Surface 1

rgba(255,255,255,0.04)

Surface 2

rgba(255,255,255,0.06)

Surface 3

rgba(255,255,255,0.08)

Surface Active

rgba(255,255,255,0.12)

Hover

rgba(255,255,255,0.14)

Pressed

rgba(255,255,255,0.18)

---

# Borders

Default

rgba(255,255,255,0.12)

Hover

rgba(255,255,255,0.18)

Focused

rgba(124,58,237,0.45)

Selected

rgba(6,182,212,0.45)

Disabled

rgba(255,255,255,0.05)

---

# Gradient Library

Aurora

Purple

↓

Blue

Nebula

Blue

↓

Pink

Sunrise

Orange

↓

Pink

Ocean

Teal

↓

Blue

Galaxy

Purple

↓

Pink

↓

Blue

Every screen should use only one dominant gradient.

---

# 15 Typography

Primary Font

Inter

Fallback

SF Pro Display

System UI

Never mix fonts.

---

# Typography Scale

Display XL

56

Display L

48

Display M

40

Heading 1

32

Heading 2

28

Heading 3

24

Title

20

Subtitle

18

Body

16

Body Small

14

Caption

12

Micro

10

---

# Font Weights

Regular

400

Medium

500

SemiBold

600

Bold

700

---

# Line Height

Display

110%

Heading

120%

Body

150%

Caption

140%

---

# Letter Spacing

Display

-2%

Heading

-1%

Body

0%

Caption

2%

---

# 16 Spacing System

Base Unit

8

Allowed Values

4

8

12

16

20

24

32

40

48

56

64

80

96

128

Never invent spacing values.

---

# Layout Rhythm

Tiny

4

Small

8

Compact

16

Comfortable

24

Relaxed

32

Large

48

Hero

64

Cinematic

96

---

# 17 Radius System

Small

8

Medium

12

Large

20

XL

28

Pill

999

Workspace Canvas

32

Dialogs

24

Cards

24

Buttons

18

Inputs

18

---

# 18 Elevation System

Elevation 0

Flat

Elevation 1

Card

Elevation 2

Floating

Elevation 3

Dialog

Elevation 4

Workspace Overlay

Elevation 5

Modal

No Material shadows.

Depth is achieved through blur and contrast.

---

# 19 Shadow System

Small

Blur 16

Medium

Blur 32

Large

Blur 48

Hero

Blur 72

Glow

Primary

Secondary

Accent

Never stack multiple heavy shadows.

---

# 20 Blur System

Small

12px

Medium

20px

Large

28px

Hero

36px

Overlay

48px

Glass blur must always pair with translucent surfaces.

Never blur without contrast.

---

# 21 Surface Hierarchy

Level 0

Background

Level 1

Glass Cards

Level 2

Floating Panels

Level 3

Dialogs

Level 4

Workspace Overlay

Level 5

Spotlight Components

Users should instantly understand depth.

---

# 22 Ambient Motion System

Lumina AI is never static.

The interface should feel quietly alive.

Movement must be subtle.

Never distracting.

Ambient Motion Includes

• Slow mesh gradient drift

• Floating blurred light orbs

• Gentle parallax

• Soft shimmer highlights

• Fade between states

• Glass reflections

• Skeleton loading

No animation should attract unnecessary attention.

---

# Motion Rules

Animations explain.

Never decorate.

Every movement has purpose.

Maximum simultaneous animations

3

Never animate everything together.

---

# 23 Empty Space Philosophy

Whitespace is content.

Never fill empty areas unnecessarily.

Every layout should breathe.

Content should never feel compressed.

Negative space communicates hierarchy.

---

# 24 Accessibility Tokens

Minimum Touch Target

48 x 48

Minimum Body Size

16

Minimum Contrast

WCAG AA

Reduced Motion

Supported

Keyboard Navigation

Required

Focus Indicators

Visible

---

# 25 AI Coding Constraints

The AI coding assistant must obey these rules.

❌ Never hardcode colors.

❌ Never use EdgeInsets.all(17).

❌ Never invent radius values.

❌ Never use Material defaults.

❌ Never mix typography.

❌ Never ignore responsive spacing.

✔ Every value comes from the Design System.

✔ Every widget uses design tokens.

✔ Every animation uses predefined motion tokens.

---

# Final Statement

The Design Tokens defined in this document are immutable.

Changing a token changes the entire product.

Creating new values outside the token system is prohibited.

Consistency is a feature.

# End of Part 2

Next:

Part 3

• Complete Glass System
• Motion Language
• Mesh Gradients
• Lighting System
• Floating Panels
• Interactive States
• Glass Recipes
• Workspace Canvas Rendering Rules

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 3
#
# Spatial Material System
# Motion Language
# Glass Recipes
# Lighting System
# Workspace Rendering
# ===================================================================

Version 1.0

Status
Draft

---

# 26 Spatial Material System

## Philosophy

Lumina AI does not use traditional UI components.

Every visible object is considered a Material.

Materials exist inside one coherent spatial environment.

Each material has

• Physical depth

• Light response

• Blur recipe

• Motion behavior

• Elevation

• Interaction rules

This creates the illusion that the interface exists in three-dimensional space.

---

# Material Hierarchy

Material 0

Background Environment

↓

Material 1

Glass Surface

↓

Material 2

Floating Surface

↓

Material 3

Interactive Surface

↓

Material 4

Overlay Surface

↓

Material 5

Modal Surface

↓

Material 6

Spotlight Surface

Every screen follows this hierarchy.

---

# 27 Background Environment

The background is never static.

It consists of four layers.

Layer 1

Dark foundation

Layer 2

Animated mesh gradient

Layer 3

Floating light orbs

Layer 4

Soft vignette

These layers should move almost imperceptibly.

The user should feel motion rather than notice it.

---

# Mesh Gradient Rules

Movement Speed

Extremely Slow

Direction

Random but smooth

Loop

Infinite

Sharp transitions

Forbidden

Sudden color shifts

Forbidden

High saturation

Forbidden

---

# Floating Light Orbs

Purpose

Create depth.

Number

Desktop

4–6

Tablet

3–4

Mobile

2–3

Opacity

5–12%

Blur

120–250 px

Movement

20–40 seconds

Random path

No bouncing.

No pulsing.

---

# 28 Glass Material Recipes

Recipe A

Navigation Surface

Blur

20 px

Opacity

8%

Border

1 px

Elevation

1

Glow

None

---

Recipe B

Cards

Blur

24 px

Opacity

10%

Border

1 px

Shadow

Soft

Radius

24

---

Recipe C

Workspace Panel

Blur

32 px

Opacity

12%

Radius

32

Border

Gradient edge

Shadow

Large

---

Recipe D

Dialog

Blur

40 px

Opacity

16%

Shadow

Hero

Radius

28

---

Recipe E

Spotlight

Blur

48 px

Glow

Enabled

Shadow

Hero

Reserved for

Upload

Premium CTA

Important Results

---

# 29 Lighting System

The interface behaves like soft glass.

Light enters from the upper left.

Highlights should follow this direction.

Never create conflicting light sources.

---

Highlight Rules

Top edge

Slightly brighter

Bottom edge

Slightly darker

Corners

Soft

No hard reflections.

---

Glow Rules

Primary actions

Soft purple glow.

Hover

Slight cyan glow.

Errors

Soft red glow.

Warnings

Soft amber glow.

Success

Soft green glow.

Glow must never overpower text.

---

# 30 Motion Language

Every movement communicates state.

Movement categories

Ambient

Navigation

Interaction

Feedback

Loading

AI Processing

Completion

---

Motion Personality

Smooth

Confident

Natural

Deliberate

Never playful.

Never bouncy.

---

Animation Curves

Standard

Ease In Out

Navigation

Ease Out

Hover

Ease Out

Modal

Ease In Out

Loading

Linear

---

Duration Tokens

Fast

120 ms

Standard

220 ms

Medium

320 ms

Slow

450 ms

Hero

700 ms

Ambient

20–40 s

---

# 31 Interaction Recipes

Hover

Desktop only.

Card lifts

4 px

Shadow increases

Glow increases

Scale

1.02

Duration

180 ms

---

Pressed

Scale

0.98

Duration

90 ms

No bounce.

---

Focus

Border

Primary

Glow

Enabled

Accessibility compliant.

---

Drag

Workspace follows pointer.

Soft shadow increases.

Drop target glows.

---

# 32 Navigation Motion

Page transitions

Fade

+

Slide

Maximum distance

24 px

Duration

250 ms

Never use default Material transitions.

---

Workspace transitions

Shared element animation.

Workspace expands naturally.

Original content remains visible.

---

# 33 Loading Experience

Loading should feel intentional.

Never use spinning circles.

Preferred loading

Skeletons

Glass shimmer

Animated placeholders

Progress bars

AI thinking indicator

---

Skeleton Rules

Match final layout.

Never use grey blocks.

Use glass placeholders.

---

AI Processing

Instead of

Loading...

Use

Understanding image...

Extracting text...

Generating summary...

Preparing response...

Users understand progress.

---

# 34 Workspace Rendering Rules

Workspace occupies

65–75%

of desktop width.

The canvas is sacred.

Nothing may obscure it unnecessarily.

---

Workspace Columns

Desktop

Sidebar

Canvas

AI Panel

Tablet

Rail

Canvas

Floating AI Panel

Mobile

Canvas

Bottom Sheet

No horizontal scrolling.

---

# 35 Material Interaction States

Default

Hover

Focused

Pressed

Selected

Disabled

Loading

Processing

Success

Error

Every component supports all states.

---

# 36 Microinteractions

Buttons

Soft elevation

Cards

Gentle lift

Search

Expands smoothly

Sidebar

Slides naturally

Dialogs

Fade + scale

Uploads

Morph into workspace

Results

Reveal progressively

Every interaction should reward the user.

---

# 37 Anti-Patterns

Forbidden

Heavy shadows

Neon everywhere

Fast animations

Large scaling

Flashy gradients

Opaque cards

Material defaults

Random elevations

Competing glows

Oversized borders

Multiple animation styles

---

# 38 Premium Standard

Before any screen is accepted it must answer YES to every question.

Does it feel calm?

Does it feel spacious?

Does it guide attention naturally?

Does it preserve hierarchy?

Does it avoid unnecessary decoration?

Does motion explain interactions?

Does lighting feel consistent?

Does the workspace remain the focus?

Would this feel at home beside products like Linear, Arc, or Apple's modern design language while still remaining an original design?

If any answer is "No",

the screen must be redesigned.

---

# End of Part 3

Next

Part 4

Adaptive Layout System

Workspace Canvas Specifications

Desktop

Tablet

Mobile

Web

Ultra-wide

Responsive Grid

Responsive Navigation

Responsive Motion

Platform Adaptation

Window Resizing

Safe Areas

Multi-window Support

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 4
#
# Adaptive Layout System
# Workspace Canvas Specification
# Responsive Architecture
# ===================================================================

Version 1.0

Status
Draft

Internal Design Language
Lumina Spatial Design System (LSDS)

---

# 39 Adaptive Design Philosophy

Lumina AI does not use responsive layouts.

Lumina AI uses Adaptive Layouts.

Responsive Design scales components.

Adaptive Design reorganizes experiences.

Every platform deserves an interface designed for its strengths.

Users should immediately feel that Lumina was built specifically for their device.

---

# Core Principle

The interface adapts to

• Screen Width

• Screen Height

• Input Method

• Window Size

• Device Orientation

• Platform

• Pointer Availability

• Keyboard Availability

• Hover Capability

No interface should simply stretch.

---

# 40 Supported Platforms

Android Phones

Android Tablets

iPhone

iPad

Web

Windows

macOS

Linux

Ultra-wide Displays

Foldables (Future)

---

# 41 Breakpoint System

Compact

0–599 px

Target

Phones

Navigation

Bottom Navigation

Workspace

Single Column

--------------------------------

Medium

600–1023 px

Target

Small Tablets

Navigation

Navigation Rail

Workspace

Two Panels

--------------------------------

Expanded

1024–1439 px

Target

Desktop

Navigation

Sidebar

Workspace

Three Panels

--------------------------------

Ultra

1440+

Target

Large Monitors

Navigation

Sidebar

Workspace

Three Panels + Utility Dock

---

# 42 Layout Principles

Desktop

The application should resemble professional productivity software.

Examples

IDE

Creative Suite

Knowledge Workspace

Not a mobile app stretched across the screen.

---

Tablet

Large touch targets.

Landscape optimized.

Resizable panels.

Minimal floating dialogs.

---

Phone

Thumb-first interaction.

Bottom sheets.

Minimal persistent controls.

Single-column experience.

---

Web

Resizable.

Fluid.

Mouse-first.

Keyboard-first.

Supports browser zoom.

Supports large windows.

---

# 43 Workspace Canvas

The Workspace Canvas is always the visual center.

Desktop Width

70%

Tablet Width

80%

Phone Width

100%

Nothing should compete with the canvas.

---

Desktop Layout

┌─────────────────────────────────────────────────────────────┐
│ Sidebar │ Workspace Canvas │ AI Context Panel │
└─────────────────────────────────────────────────────────────┘

Sidebar

18%

Canvas

58%

AI Panel

24%

---

Tablet Layout

┌────────────────────────────┐
│ Rail │ Workspace │
│ │ Canvas │
└────────────────────────────┘

AI Panel

Floating Drawer

---

Phone Layout

┌────────────────────┐
│ Workspace Canvas │
├────────────────────┤
│ Bottom Sheet AI │
└────────────────────┘

---

# 44 Adaptive Navigation

Desktop

Permanent Sidebar

Workspace Switcher

Collections

History

Settings

Profile

Hover States

Keyboard Shortcuts

Context Menus

---

Tablet

Navigation Rail

Expandable Labels

Floating AI Drawer

---

Phone

Glass Bottom Navigation

Context FAB

Swipe Gestures

Bottom Sheets

---

# 45 Window Resizing

Desktop windows should adapt continuously.

No layout jumps.

Panels resize proportionally.

Sidebar

Collapsible

AI Panel

Resizable

Canvas

Always prioritized.

---

# 46 Foldables

Future Support

Dual-screen awareness.

Workspace on left.

AI Panel on right.

---

# 47 Safe Areas

Respect

Dynamic Island

Notches

Camera Holes

System Bars

Navigation Bars

Window Insets

---

# 48 Orientation

Portrait

Single-column workspace.

Landscape

Expanded workspace.

Never rotate layouts blindly.

Reorganize intelligently.

---

# 49 Multi-Window

Desktop

Multiple Lumina windows supported.

Independent navigation.

Independent workspace state.

---

# 50 Drag & Drop

Desktop

Supported.

Drop files anywhere onto Workspace Home.

Upload begins immediately.

Hover overlay appears.

---

Tablet

Supported where OS allows.

---

Phone

Gallery

Camera

Share Sheet

---

# 51 Keyboard Experience

Desktop

Keyboard-first.

Required Shortcuts

Ctrl + U

Upload

Ctrl + K

Search

Ctrl + H

History

Ctrl + ,

Settings

Esc

Close Dialog

Delete

Delete Workspace

Space

Preview

Enter

Primary Action

Tab

Navigate

Shift + Tab

Reverse Navigation

---

# 52 Mouse Experience

Hover Elevation

Supported

Pointer Cursor

Meaningful

Right Click

Context Menu

Drag Selection

Supported

Tooltip Delay

400 ms

---

# 53 Touch Experience

Minimum Touch Target

48 × 48

Swipe

History

Pinch

Zoom

Long Press

Context Menu

Double Tap

Focus Content

---

# 54 Platform Adaptation

Android

Material behavior where appropriate.

Maintain LSDS visuals.

---

iOS

Native scrolling physics.

Native gestures.

Maintain LSDS visuals.

---

Desktop

Mouse-first.

Hover-first.

Resizable.

---

Web

Adaptive browser layout.

URL routing.

Responsive resizing.

---

# 55 AI Context Panel

Desktop

Docked

Resizable

Always visible

---

Tablet

Floating

Expandable

---

Phone

Bottom Sheet

Collapsed by default

Expandable with drag

---

# 56 Collections Panel

Desktop

Permanent Sidebar

Tablet

Drawer

Phone

Modal Sheet

---

# 57 Empty States

Every empty screen contains

Illustration

Headline

Explanation

Primary Action

Never display

"No Data"

or

"Empty"

alone.

---

# 58 Loading States

Every page defines

Skeleton

Glass Placeholder

Shimmer

Progressive Loading

Never blank screens.

---

# 59 Adaptive Motion

Desktop

Hover

Pointer Tracking

Subtle Lift

---

Tablet

Gesture Motion

---

Phone

Touch Motion

Bottom Sheet Physics

---

# 60 Layout Acceptance Checklist

Every screen must satisfy:

✓ Responsive

✓ Adaptive

✓ Keyboard Friendly

✓ Mouse Friendly

✓ Touch Friendly

✓ Accessible

✓ Canvas First

✓ Platform Appropriate

✓ Smooth Resizing

✓ No Overflow

✓ No Dead Space

✓ No Pixel Stretching

---

# End of Part 4

Next

Part 5

Component Library

This will be the largest section in Volume II.

Every reusable component will receive its own specification, including:

• Purpose
• Anatomy
• Design Tokens
• Variants
• States
• Motion
• Accessibility
• Responsive Behavior
• Usage Rules
• AI Coding Constraints

This becomes the implementation blueprint for every Flutter widget in Lumina AI.

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 5
#
# LSDS Component Library
#
# Version 1.0
# ===================================================================

Status
Draft

Internal Name

Lumina Spatial Design System (LSDS)

---

# 61 Component Philosophy

A component is not merely a widget.

It is a reusable experience.

Every component must satisfy:

Consistency

Accessibility

Responsiveness

Animation

Performance

Maintainability

Every component must support

Desktop

Tablet

Phone

Web

Dark Theme

Future Light Theme

Reduced Motion

Keyboard

Mouse

Touch

---

# Component Rules

Every component has

Purpose

Anatomy

Variants

States

Motion

Accessibility

Adaptive Behavior

Coding Constraints

---

# 62 GlassButton

Purpose

Primary interaction.

Never use Flutter ElevatedButton.

---

Anatomy

Container

↓

Glass Surface

↓

Icon

↓

Label

↓

Glow Layer

---

Variants

Primary

Secondary

Ghost

Danger

Success

Icon Only

FAB

---

States

Default

Hover

Pressed

Focused

Disabled

Loading

Success

Error

---

Adaptive Behaviour

Desktop

Icon + Label

Tablet

Compact

Phone

Full Width

Motion

Hover Lift

4 px

Glow Increase

Pressed Scale

0.98

Duration

180 ms

---

# 63 GlassCard

Purpose

Present information.

Never use Material Card.

---

Variants

Feature Card

History Card

Workspace Card

Collection Card

Statistics Card

Preview Card

AI Result Card

---

Structure

Glass Layer

↓

Content

↓

Actions

↓

Status

---

Rules

No opaque background.

Blur required.

Gradient border.

Rounded

24 px.

---

# 64 WorkspaceCanvas

Priority

Critical

The most important component.

The entire application revolves around this widget.

---

Children

Original Content

AI Layer

Metadata

Timeline

Actions

Selection

Annotations (Future)

---

Desktop

Resizable

Tablet

Adaptive

Phone

Full Screen

---

Rules

Canvas always receives layout priority.

---

# 65 AIContextPanel

Purpose

Provide contextual AI actions.

Not global navigation.

Actions depend on current workspace.

---

Contains

Describe

OCR

Summarize

Translate

Caption

Marketing Copy

Food Analysis

Plant Recognition

Export

Share

---

Desktop

Docked

Tablet

Floating

Phone

Bottom Sheet

---

# 66 GlassSearchBar

Purpose

Universal Search

Searches

History

Collections

OCR

Workspace Names

---

Features

Instant Search

Recent Searches

Keyboard Shortcut

Voice Search (Future)

---

Desktop

Expanded

Phone

Compact

---

# 67 Sidebar

Desktop only.

Contains

Workspace Switcher

History

Collections

Settings

Profile

Upload

Hover

Supported

Collapse

Supported

Resizable

Future

---

# 68 NavigationRail

Tablet only.

Collapsed

Expanded

Adaptive Labels

Selection Indicator

---

# 69 Bottom Navigation

Phone only.

Maximum Tabs

5

Floating

Glass Material

Rounded

Never full-width rectangle.

---

# 70 UploadZone

Purpose

Create new Workspace.

Desktop

Drag & Drop

Tablet

Gallery

Phone

Gallery

Camera

Files

---

Animation

Morph into Workspace.

---

# 71 AIResultCard

Purpose

Display AI output.

Sections

Title

Summary

Structured Content

Actions

Copy

Share

Save

Continue

---

Expandable

Yes

Collapsible

Yes

Selectable

Yes

---

# 72 Timeline

Displays

Workspace History

AI Actions

Edits

Exports

Favorites

Chronological.

Newest first.

---

# 73 CollectionCard

Purpose

Workspace grouping.

Contains

Preview

Count

Recent Activity

Color Accent

---

# 74 Dialog

Never use AlertDialog.

Glass only.

Variants

Confirmation

Error

Information

Success

Custom

---

# 75 Bottom Sheet

Phone only.

Glass Surface.

Blurred.

Draggable.

Snap Points

25%

50%

90%

---

# 76 Toast

Floating.

Top Right Desktop.

Bottom Mobile.

Glass Surface.

Auto Dismiss

4 seconds.

---

# 77 Empty State

Contains

Illustration

Headline

Description

Primary Action

Secondary Action

Never empty.

---

# 78 Skeleton

Glass Placeholder.

Animated shimmer.

Matches final layout.

No grey rectangles.

---

# 79 Floating Action Button

Purpose

Quick Upload.

Only one FAB per screen.

Transforms into Workspace.

---

# 80 UserAvatar

Variants

Small

Medium

Large

Presence Indicator

Online

Offline

Future

---

# 81 StatisticsTile

Shows

Workspaces

AI Analyses

Storage

Usage

Never overload.

Maximum

4 metrics.

---

# 82 Component Accessibility

Every component supports

Screen Readers

Keyboard

Hover

Touch

Focus

Reduced Motion

High Contrast

Dynamic Type

---

# 83 Component Motion Rules

Hover

180 ms

Press

90 ms

Expand

250 ms

Dialog

320 ms

Page

250 ms

Hero

700 ms

Ambient

20–40 s

---

# 84 Context-Aware Components

Every LSDS component adapts automatically based on:

Platform

Input Method

Available Width

Workspace State

Theme

Accessibility

Example

GlassButton

Phone

↓

Icon Above Text

Desktop

↓

Icon Left Text

Ultra Wide

↓

Expanded Action Button

Accessibility

↓

Higher Contrast

Larger Touch Area

Reduced Motion

↓

Static Hover

No Scale

---

# 85 Component Acceptance Checklist

A component is complete only if

✓ Uses LSDS tokens

✓ Responsive

✓ Adaptive

✓ Animated

✓ Accessible

✓ Documented

✓ Reusable

✓ Theme Aware

✓ Context Aware

✓ Performance Optimized

---

# End of Part 5

Next

Part 6

Complete Screen Blueprints

Every screen will include

• Pixel Layout

• Responsive Layout

• Widget Tree

• Motion

• Adaptive Rules

• Empty States

• Error States

• Loading States

• AI Coding Constraints

This is where Lumina AI's UI will become fully implementation-ready.

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 6
#
# Scene Architecture
# Complete Scene Blueprints
#
# Lumina Spatial Design System (LSDS)
# ===================================================================

Version 1.0

Status
Draft

---

# 86 Scene Philosophy

Lumina AI does not use pages.

Lumina AI is composed of Scenes.

A Scene represents an entire user experience rather than a single route.

Every Scene owns

• Layout

• Navigation

• Motion

• Adaptive Behaviour

• Components

• State

• Accessibility

Scenes communicate with one another but remain internally independent.

---

# Scene Hierarchy

Application

↓

Scene

↓

Section

↓

Component

↓

Element

Never skip hierarchy.

---

# Scene Rules

Each Scene must contain

Purpose

Layout

Adaptive Layout

Components

Motion

Loading

Empty State

Error State

Accessibility

Keyboard Support

AI Coding Rules

---

# 87 Authentication Scene

Purpose

Introduce users to Lumina AI.

Minimal.

Elegant.

Fast.

---

Layout

Desktop

Split Layout

Left

Brand Story

Right

Authentication Card

---

Tablet

Centered Glass Card

---

Phone

Full Screen

Glass Surface

---

Components

GlassCard

GlassButton

GlassInput

AnimatedBackground

BrandIllustration

---

Motion

Fade In

Logo Reveal

Card Float

Input Focus Glow

---

Loading

Glass Skeleton

---

Error

Inline Validation

Never Dialog

---

# 88 Workspace Home Scene

Purpose

Entry point into the Workspace ecosystem.

This is NOT a dashboard.

It is a living workspace overview.

---

Sections

Greeting

Universal Search

Continue Working

Pinned Collections

Recent Workspaces

Quick Upload

AI Suggestions

Workspace Timeline

---

Desktop Layout

Sidebar

↓

Workspace Feed

↓

Suggestion Panel

---

Tablet

Rail

↓

Workspace Feed

↓

Floating AI Drawer

---

Phone

Workspace Feed

↓

Bottom Navigation

↓

Floating Upload

---

Rules

Never show more than 8 recent workspaces.

Primary CTA is Upload.

Whitespace must dominate.

---

# 89 Workspace Scene

Priority

Highest

This is the heart of Lumina AI.

---

Layout

Desktop

┌───────────────────────────────────────────────┐
│ Sidebar │ Canvas │ AI Panel │
└───────────────────────────────────────────────┘

---

Tablet

Rail

↓

Canvas

↓

Floating AI Panel

---

Phone

Canvas

↓

Expandable AI Bottom Sheet

---

Canvas Contains

Original Content

AI Results

Timeline

Metadata

Actions

---

AI Panel

Describe

OCR

Summarize

Translate

Caption

Marketing

Receipt

Export

Share

The panel changes according to workspace type.

---

Motion

Workspace Expansion

Shared Element Transition

Context Panel Slide

Result Reveal

---

# 90 Search Scene

Purpose

Global Workspace Search.

Search

Workspace Names

OCR Text

Collections

Tags

AI Outputs

---

Desktop

Large Overlay

Tablet

Modal

Phone

Full Screen

---

Keyboard Shortcut

Ctrl + K

---

# 91 Collections Scene

Purpose

Workspace organization.

Layout

Collection Grid

Collection Detail

Workspace List

Search

Filters

Sort

---

Desktop

Masonry Grid

Tablet

2 Columns

Phone

Single Column

---

# 92 Profile Scene

Purpose

Identity

Usage

Storage

Achievements

Future Subscription

---

Sections

Profile

Statistics

Storage

Recent Activity

Settings Shortcut

---

# 93 Settings Scene

Purpose

Configure Lumina AI.

Sections

Appearance

Workspace

Language

Notifications

Privacy

Storage

About

Developer

---

Rules

Never exceed two levels of nesting.

---

# 94 Empty Scene

Every empty Scene contains

Illustration

Headline

Explanation

Primary Action

Helpful Tip

No dead ends.

---

# 95 Loading Scene

Never show blank pages.

Always use

Glass Skeleton

Animated Gradient

Shimmer

Progressive Content

---

# 96 Error Scene

Contains

Friendly Title

Explanation

Retry

Support

Error Code

No technical stack traces.

---

# 97 Adaptive Scene Behaviour

Desktop

Hover

Keyboard

Multi-column

Resizable Panels

---

Tablet

Touch

Rail

Floating Drawers

Landscape Priority

---

Phone

Bottom Sheets

Gestures

Thumb Reach

Single Column

---

# 98 Scene Motion

Scene Enter

Fade + Slide

250 ms

Scene Exit

Fade

220 ms

Workspace Open

Hero Expansion

700 ms

Dialog

Scale + Fade

320 ms

Search

Blur Background

Expand Search

---

# 99 Scene Accessibility

Every Scene supports

Keyboard Navigation

Screen Readers

Reduced Motion

High Contrast

Dynamic Text

VoiceOver

TalkBack

---

# 100 Scene Acceptance Checklist

A Scene is complete only if

✓ Uses LSDS Components

✓ Uses LSDS Tokens

✓ Adaptive

✓ Responsive

✓ Accessible

✓ Context Aware

✓ Motion Complete

✓ Loading Complete

✓ Error Complete

✓ Empty State Complete

✓ Keyboard Friendly

✓ Mouse Friendly

✓ Touch Friendly

✓ Production Ready

---

# End of Part 6

Next

Part 7

AI Coding Specification

Flutter Architecture

Folder Structure

Naming Conventions

Riverpod Rules

Responsive Engine

Animation Engine

Widget Standards

Performance Rules

Code Generation Constraints

This document becomes the exact instruction manual for AI coding agents.

# ===================================================================
# Lumina AI
# Volume II
# UI / UX Design System
#
# Part 7
#
# AI Coding Specification
# Flutter Engineering Standards
# LSDS Implementation Guide
# ===================================================================

Version
1.0

Status
Final

Audience

AI Coding Agents

Flutter Developers

Contributors

---

# 101 Purpose

This document defines mandatory implementation rules.

The AI coding assistant must never invent architecture.

Every implementation must follow LSDS.

---

# 102 Core Rule

Never design while coding.

Everything already exists inside the Design System.

Implementation should only translate specifications into Flutter widgets.

---

# 103 Flutter Stack

Framework

Flutter Stable

Language

Dart

State Management

Riverpod

Navigation

go_router

Dependency Injection

Riverpod Providers

Local Database

Hive

Backend

Firebase

Authentication

Firebase Auth

Cloud Database

Cloud Firestore

Storage

Firebase Storage

AI

Gemini

Animations

flutter_animate

Image

cached_network_image

SVG

flutter_svg

Icons

phosphor_flutter

---

# 104 Folder Structure

lib/

core/

theme/

tokens/

animations/

constants/

extensions/

utils/

widgets/

features/

authentication/

workspace/

collections/

search/

profile/

settings/

services/

repositories/

providers/

models/

router/

main.dart

---

Rules

Feature-first architecture.

Never place business logic inside widgets.

---

# 105 Widget Rules

Every widget

Single responsibility.

Maximum widget length

200 lines.

Maximum file length

500 lines.

Split aggressively.

---

Widgets are

Stateless whenever possible.

Use ConsumerWidget only when state is required.

---

# 106 Design Tokens

Never use

Color(...)

EdgeInsets.all(...)

Radius.circular(...)

TextStyle(...)

directly inside widgets.

Always use

AppColors

AppSpacing

AppTypography

AppRadius

AppMotion

AppBlur

AppShadow

---

# 107 Scene Rules

Every Scene

Own directory.

Own state.

Own routing.

Own components.

Own providers.

Never access another Scene's internal state directly.

---

# 108 Component Rules

Never duplicate widgets.

If two widgets share more than 80% structure

Create reusable component.

---

Every LSDS Component supports

Desktop

Tablet

Phone

Hover

Touch

Keyboard

Reduced Motion

Dark Theme

Future Light Theme

---

# 109 Responsive Engine

Never check

MediaQuery.width

inside every widget.

Use centralized breakpoint service.

AdaptiveLayout

Compact

Medium

Expanded

Ultra

Widgets respond using layout builders.

---

# 110 Motion Rules

No default Material transitions.

Every transition

Fade

Slide

Scale

Hero

according to LSDS.

Motion tokens only.

---

# 111 State Management

Riverpod only.

State separated into

UI State

Domain State

Remote State

Never mix.

---

# 112 Repository Pattern

UI

↓

Repository

↓

Datasource

↓

Firebase

↓

Gemini

No widget accesses Firebase directly.

---

# 113 Error Handling

Every async call returns

Loading

Success

Failure

Offline

Unauthorized

Timeout

Rate Limit

Cancelled

Unknown

No FutureBuilder spaghetti.

---

# 114 Performance Rules

Lazy Lists

Required.

Pagination

Required.

Const constructors

Preferred.

Image compression

Required.

Image caching

Required.

Rebuild minimization

Mandatory.

---

# 115 Accessibility Rules

Semantic labels

Required.

Keyboard shortcuts

Required.

Screen reader

Required.

Minimum touch target

48dp.

---

# 116 Living Interface

The interface evolves.

Never hardcode recommendations.

Homepage adapts to

Recent Workspaces

Frequently Used Actions

Collections

User Activity

Recent Uploads

The UI should become more useful over time.

---

# 117 AI Prompt Rules

Prompt templates live separately.

Never concatenate prompts inside widgets.

Prompt Service owns prompts.

---

# 118 Naming Convention

Widgets

PascalCase

Services

PascalCase

Files

snake_case

Variables

camelCase

Constants

camelCase prefixed with k where appropriate

No abbreviations.

---

# 119 Code Style

Prefer composition.

Avoid inheritance.

Meaningful names.

Documentation comments.

Lint clean.

No warnings.

---

# 120 Forbidden Practices

❌ Inline styling

❌ Hardcoded values

❌ Business logic in UI

❌ Duplicate widgets

❌ Massive build methods

❌ Nested FutureBuilders

❌ Magic numbers

❌ Anonymous callbacks over 20 lines

❌ setState for global state

❌ Copy-paste components

---

# 121 AI Coding Prompt

Before generating code, the AI must assume:

"I am contributing to Lumina AI.

I must follow the Lumina Spatial Design System.

I must not invent new design tokens.

I must not invent new spacing.

I must not invent new colors.

I must not invent new widgets.

I must build reusable, adaptive, accessible Flutter components.

The Workspace Canvas is the center of the application.

Every implementation must match LSDS."

---

# 122 Definition of Done

No feature is complete until it is

✓ Responsive

✓ Adaptive

✓ Accessible

✓ Animated

✓ Token-driven

✓ Context-aware

✓ Living Interface compliant

✓ Repository-based

✓ Riverpod integrated

✓ Firebase ready

✓ Tested

✓ Production quality

---

# LSDS Manifesto

Lumina AI is not a collection of Flutter screens.

It is a living workspace.

Every component exists to reduce cognitive load.

Every animation communicates intent.

Every layout adapts naturally.

Every interaction respects the user's focus.

The interface should disappear.

The user's work should remain.

This philosophy is the foundation of Lumina AI.

# End of Volume II


# ===================================================================
# Volume II Final Revision (v2.0)
# ===================================================================

## Added Design Standards

### Iconography System
- Icon Library: phosphor_flutter
- Style: Rounded, 2px stroke
- Sizes: 16, 20, 24, 32, 48
- Use outline icons by default; filled icons only for active states.

### Illustration System
- Calm, minimal illustrations.
- Empty, loading, success, and error illustrations follow the LSDS visual language.

### Data Visualization
- 12-column responsive charts on desktop.
- 8-column tablet.
- 4-column mobile.
- Progress rings, storage cards, analytics panels use design tokens only.

### Responsive Grid
- Desktop: 12 columns
- Tablet: 8 columns
- Mobile: 4 columns
- 8pt spacing system
- Maximum readable content width: 1280px

### Animation Catalogue
Every animation defines:
- Duration
- Curve
- Scale
- Opacity
- Blur
- Delay
- Accessibility fallback

### AI Interaction UX
- Streaming responses
- Cancel generation
- Regenerate response
- Compare responses
- Prompt history
- Model selector (future)

### Theme Support
- Dark (default)
- Light (future)
- OLED Black
- High Contrast
- System Theme

### Design QA Checklist
Every Scene must validate:
- Token usage
- Accessibility
- Motion
- Contrast
- Blur consistency
- Responsive layout
- Performance
- Keyboard support
- Touch support
- Screen reader support

## Final Manifesto

Lumina AI is an AI Visual Workspace built around a Workspace Canvas.

The Lumina Spatial Design System (LSDS) defines every visual, interactive,
and adaptive aspect of the product.

Content is the center.
AI is contextual.
Motion is meaningful.
Consistency is mandatory.

This document is the single source of truth for all frontend implementation.
