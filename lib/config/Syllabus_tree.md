
# Flutter Complete Syllabus

## Module 00: Fundamentals

- **01. App Structure**
  - Entry Point (`main.dart`)
  - MaterialApp Entry Point
  - CupertinoApp Entry Point
- **02. Widget Structure**
  - MaterialApp Stage: StatelessWidget vs. StatefulWidget
  - CupertinoApp Stage: StatelessWidget vs. StatefulWidget

---

## Module 01: MaterialApp (`01.MatApp`)

### 01. Display System

- **Text & Typography**: Normal Text, RichText & TextSpan, SelectableText, DefaultTextStyle
- **Icons**: Icon, IconTheme, ImageIcon
- **Images**: Image (Asset, Network, File), FadeInImage, RawImage, CachedNetworkImage
- **Branding & Avatars**: FlutterLogo, CircleAvatar, Placeholder
- **Tiles & Cards**: Tooltip, Badge, Card, ListTile, GridTile, ExpansionTile, AboutListTile, LicensePage
- **Separators**: Divider, VerticalDivider
- **Chips**: Chip, ActionChip, ChoiceChip, FilterChip, InputChip
- **Progress Indicators**: CircularProgressIndicator, LinearProgressIndicator, RefreshProgressIndicator
- **Media**: AudioPlayer Integration, VideoPlayer Integration, Chewie Player Wrappers

### 02. Layout System

- **Foundation**: Container
- **Linear Layouts**: Row, Column, Flex, MainAxis vs. CrossAxis, Alignments, MainAxisSize, Text & Vertical Directions, Expanded, Flexible, Spacer
- **Overlays**: Stack, Positioned, IndexedStack, Align inside Stack, Overflow Behavior
- **Flow**: Wrap, Flow
- **Tables**: Table, TableRow
- **Scrollables**: SingleChildScrollView, ListView (standard, builder, separated, custom), ListTile Scroll, ShrinkWrap, ScrollDirection, GridView (standard, builder, count, extent, custom, delegates, properties), PageView (standard, builder, PageController, onPageChanged)
- **Tab Views**: Tab, TabBar, TabBarView, DefaultTabController, TabController
- **Advanced Scrolling**: CustomScrollView, NestedScrollView, InteractiveViewer, Scrollbar, RefreshIndicator, DraggableScrollableSheet
- **Slivers**: Fundamentals, SliverToBoxAdapter, SliverList, SliverFixedExtentList, SliverPrototypeExtentList, SliverGrid, SliverPadding, SliverFillRemaining, SliverFillViewport, SliverAppBar, SliverPersistentHeader, Sliver Deep Revision
- **Responsive Layouts**: MediaQuery, LayoutBuilder, OrientationBuilder, Platform Identification, `kIsWeb`, `defaultTargetPlatform`, Theme Platform Adapters
- **Page Structure**: AppBar, Drawer, NavigationDrawer, BottomNavigationBar, NavigationBar, NavigationRail, BottomSheet, FloatingActionButton
- **Layout Helpers**: Margin, Spacer, Padding, EdgeInsets, Alignment, SizedBox, FittedBox, FractionallySizedBox, AspectRatio, ConstrainedBox, Visibility, Offstage, IgnorePointer, BoxConstraints, Intrinsic Height/Width, Directionality, SafeArea, Screen Safety, Placeholder, Baseline

### 03. Styling & Decoration

- **Colors**: Introduction, Colors Class, Constructors, Material Colors, MaterialAccentColor, ColorScheme
- **Text Styling**: TextStyle, FontWeight, FontStyle, TextDecoration, TextOverflow, StrutStyle
- **Box Decoration**: Decoration, BoxDecoration, ShapeDecoration, DecorationImage
- **Borders**: Border, BorderSide, BorderRadius, Radius, RoundedRectangleBorder, CircleBorder, StadiumBorder, BeveledRectangleBorder, ContinuousRectangleBorder
- **Shadows**: Shadow, BoxShadow
- **Gradients**: LinearGradient, RadialGradient, SweepGradient
- **Shapes**: BoxShape, ShapeBorder, OutlinedBorder, NotchedShape
- **Render Architecture**: Widget Tree, Element Tree, Render Tree, Pipeline Phases (Build, Layout, Paint)
- **Render Objects**: RenderObject, RenderBox, RenderSliver, RenderObjectWidget (Single, Multi, Leaf)
- **Custom Painting**: CustomPaint, CustomPainter, Canvas, Paint, Path, PathMetric, PictureRecorder, Vertices
- **Performance Optimization**: RepaintBoundary, ShouldRepaint, Layer Tree, Raster Cache, Performance Overlay
- **Clipping**: ClipRect, ClipRRect, ClipOval, ClipPath
- **Shaders & Filters**: ShaderMask, ImageFilter, ColorFilter, BackdropFilter, FragmentShader
- **Advanced Rendering**: Hit Testing, Compositing, Layer Management, Rasterization, Frame Pipeline
- **Visual Effects**: Opacity, ImageFiltered, ColorFiltered, PhysicalModel
- **Material Effects**: Material, Ink, InkWell, InkResponse
- **Transforms**: Transform, Matrix4, Scale, Translate, Flip

### 04. Theme System

- Theme, ThemeData, ColorScheme, TextTheme, IconThemeData, AppBarTheme, CardTheme, ChipThemeData, DividerThemeData, InputDecorationTheme, Button Themes, Material 3 & Dynamic Color, Dark/Light Mode Switching

### 05. Input System

- **Text Input**: TextField, TextFormField, EditableText, CupertinoTextField, Autocomplete, RawAutocomplete, InputChip
- **Forms**: Form, FormField, Controller Layer, Validation Layer, Submission Handling, Result Processing, Structured Data
- **Search Input**: SearchBar, SearchAnchor, SearchDelegate
- **Choice Inputs**: Checkbox, Radio, Switch, SegmentedButton
- **Date & Time**: DatePicker, TimePicker, DateRangePicker
- **File Input**: FilePicker Integration, Path Provider
- **Media Input**: ImagePicker, Camera Preview
- **Color & Signature**: ColorPicker, Signature Pad Canvas
- **Barcode & Location**: MobileScanner, QRImageView, Location Services, Geolocator
- **Voice & Sensors**: SpeechToText, AudioRecorder, SensorsPlus Integration
- **Security & System**: LocalAuth (Biometrics), Clipboard Data, Hardware Keyboard, Pointer Devices

### 06. Selection System

- Checkbox & CheckboxListTile, Radio, Switch, Slider, RangeSlider, SegmentedButton, DropdownMenu, DatePicker, TimePicker, SelectionArea, SelectableText, TextSelectionToolbar, SelectionContainer

### 07. Interaction System

- **Buttons**: ElevatedButton, FilledButton, FilledButton Tonal, OutlinedButton, TextButton, IconButton, FloatingActionButton, BackButton, CloseButton, ButtonStyle
- **Gestures**: GestureDetector, InkWell, InkResponse, Listener, MouseRegion, AbsorbPointer, IgnorePointer
- **Pointer Events**: PointerDownEvent, PointerMoveEvent, PointerUpEvent
- **Keyboard & Focus**: RawKeyboardListener, HardwareKeyboard, Focus, FocusNode, FocusScope, FocusTraversalGroup, Shortcuts, Actions, Intent
- **Drag & Drop**: Draggable, LongPressDraggable, DragTarget, Dismissible, DropdownButton
- **Chips Events**: FilterChip Events, InputChip Deletion
- **Scroll & Nav Interaction**: ScrollNotification, ScrollController, PopScope
- **Feedback & Accessibility**: HapticFeedback, Feedback Wrap, Semantics, OverlayEntry, GestureRecognizer

### 08. Navigation System

- **Navigator 1.0**: Navigator, Route, NavigatorState, Push/Pop Operations, Replacement & PopUntil, CanPop, MaterialPageRoute, CupertinoPageRoute, PageRouteBuilder, ModalRoute, PopupRoute, LocationHistoryRoute
- **Named Routes**: Routes Map, InitialRoute, RouteSettings, PushNamed, PopAndPushNamed, OnGenerateRoute, OnUnknownRoute
- **Dialogs & Overlays**: ShowDialog, AlertDialog, SimpleDialog, ShowGeneralDialog, ShowModalBottomSheet, ShowBottomSheet, PopupMenuButton, Route-Based Overlays
- **Nested Navigation**: Nested Navigator, Shell Navigation, Tab Navigation
- **Navigator 2.0**: Page & Router Delegate, RouteInformationParser, Router Widget Deep Links
- **GoRouter**: GoRoute Setup, ShellRoute, Redirects & State, Deep Linking, Web URL Strategy, Typed Routes, Code Generation

---

## Module 02: CupertinoApp (`02.CupApp`)

### 01. Display System

- **Text**: Cupertino Text Styles, SF Pro System Fonts
- **Icons**: CupertinoIcons, Icon Sizes & Colors
- **Lists**: CupertinoListSection, Inset ListSection, CupertinoListTile, Notched ListTile
- **Progress**: CupertinoActivityIndicator, Partially Revealed Indicator

### 02. Layout & Page Structure

- **Scaffold**: CupertinoPageScaffold, Background Decorations
- **Navigation Bar**: CupertinoNavigationBar, Leading/Trailing Actions, CupertinoSliverNavigationBar, Large Title Collapse
- **Tabs**: CupertinoTabScaffold, CupertinoTabBar, CupertinoTabView, Independent Tab Stacks
- **Scroll**: CupertinoScrollbar, BouncingScrollPhysics, CupertinoSliverRefreshControl

### 03. Theme System

- CupertinoTheme, CupertinoThemeData, Dynamic Colors, System Colors, CupertinoTextThemeData, iOS Auto Dark Mode

### 04. Input System

- **Text Fields**: CupertinoTextField, Borderless TextField, CupertinoSearchTextField
- **Forms**: CupertinoFormSection, Inset Grouped FormSection, CupertinoFormRow, CupertinoTextFormFieldRow

### 05. Selection & Controls

- **Toggles**: CupertinoSwitch, CupertinoSlider
- **Segmented Controls**: CupertinoSegmentedControl, CupertinoSlidingSegmentedControl
- **Pickers**: CupertinoPicker, Picker Builder, CupertinoDatePicker (Date, Time, DateTime), CupertinoTimerPicker

### 06. Buttons & Context Actions

- **Buttons**: CupertinoButton, Filled Button, Tinted Button
- **Context Menu**: CupertinoContextMenu, CupertinoContextMenuAction

### 07. Dialogs, Popups & Overlays

- **Alerts**: ShowCupertinoDialog, CupertinoAlertDialog, CupertinoDialogAction
- **Action Sheets**: ShowCupertinoModalPopup, CupertinoActionSheet, CupertinoActionSheetAction
- **Surfaces**: CupertinoPopupSurface

### 08. Navigation System

- **Routes**: CupertinoPageRoute, iOS Swipe Back Gesture
- **Controllers**: CupertinoTabController, Nested CupertinoTabView Routing


## Module 03: Adaptive App Architecture (`03.AdaptApp`)[cite: 13]

### 01. Platform Core & Targeting

- TargetPlatform Enum Usage[cite: 13]
- Theme Platform Context Access[cite: 13]
- `kIsWeb` Guard Implementation[cite: 13]
- IO Platform Check (`Platform.isIOS`, `Platform.isAndroid`, etc.)[cite: 13]
- Platform Override for Debugging[cite: 13]

### 02. Built-in Adaptive Widgets

- Switch.adaptive[cite: 13]
- Slider.adaptive[cite: 13]
- ProgressIndicator.adaptive[cite: 13]
- Checkbox.adaptive[cite: 13]
- Radio.adaptive[cite: 13]
- Icons.adaptive[cite: 13]
- SwitchListTile.adaptive[cite: 13]

### 03. Adaptive Dialogs, Sheets & Overlays

- showAdaptiveDialog Implementation[cite: 13]
- AdaptiveDialogAction Configuration[cite: 13]
- Adaptive ActionSheet & BottomSheet[cite: 13]
- Adaptive DatePicker[cite: 13]
- Adaptive Context Menu[cite: 13]

### 04. Universal Navigation Patterns

- Adaptive Scaffold Setup[cite: 13]
- Dynamic Transition: BottomNav to NavRail[cite: 13]
- Dynamic Transition: NavRail to Permanent Drawer[cite: 13]
- Material vs. Cupertino Navigation Bar Switcher[cite: 13]
- Two-Pane Master-Detail View Pattern[cite: 13]

### 05. Screen Breakpoints & Form Factors

- Window Size Classes (Compact, Medium, Expanded)[cite: 13]
- LayoutBuilder Breakpoint Management[cite: 13]
- Foldable & Dual-Screen Support[cite: 13]
- Centering & Constraining Long Lists[cite: 13]
- Dynamic Grid Span Calculation[cite: 13]

### 06. Input Modality Adaptation

- Touch vs. Mouse Hover Interactions[cite: 13]
- Scrollbar Behavior Across Desktop & Mobile[cite: 13]
- Hardware Keyboard Shortcuts[cite: 13]
- Desktop Right-Click Context Menu Support[cite: 13]

### 07. Custom Adaptive Abstraction Architecture

- PlatformWidget Abstract Base Class[cite: 13]
- Custom Adaptive Button Wrapper[cite: 13]
- Custom Adaptive TextField Wrapper[cite: 13]
- Platform Page Route Factory Pattern[cite: 13]
