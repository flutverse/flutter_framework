# Flutter Framework Learning System

একটি bilingual Flutter full-stack learning repository যেখানে Flutter, Dart,
Firebase, PostgreSQL, backend API, testing, security, DevOps এবং real-world
project একসাথে শেখা ও practice করা হবে।

## Repository Map

- `01.Study/`: theory, concepts, architecture, and technology notes.
- `02.Practical/`: runnable examples, widget references, tasks, and exercises.
- `03.Project/`: beginner থেকে full-stack production-style projects.
- `lib/`: active Flutter application source and layered architecture.
- `backend/`: PostgreSQL-backed API structure, migrations, seeds, and tests.
- `firebase/`: safe Firebase rules and configuration templates.
- `test/`: Flutter unit, widget, and integration tests.
- `docs/`: setup, architecture, decisions, and learning-system rules.
- `assets/`: images, icons, fonts, and JSON resources.

## Note Standard

প্রতিটি গুরুত্বপূর্ণ topic-এ concept, constructor/properties, code example,
English ও Bangla code breakdown, common mistakes, practical task এবং প্রয়োজন
অনুযায়ী full runnable demo থাকবে। বিস্তারিত নিয়ম [docs/LEARNING_SYSTEM.md](docs/LEARNING_SYSTEM.md)-এ আছে।

## First Full-stack Project

PostgreSQL-based project plan: [03.Project/04.Fullstack_Projects/02.PostgreSQL_Fullstack_App](03.Project/04.Fullstack_Projects/02.PostgreSQL_Fullstack_App)

## Local Verification

```text
flutter doctor
flutter pub get
flutter analyze
flutter test
```

Never commit passwords, private keys, JWT secrets, service-account files, or
production Firebase configuration.
