# Skill coverage gaps — CameraOpenCV (WILL change skill)

## 1. "C++/WinRT out of scope — refuse" is ambiguous about native dependencies
- **Problem:** the front-matter "refuse" clause could be misread to reject a C# app whose
  *solution* contains a C++/WinRT/.vcxproj component. Only the **app project's own
  language** should trigger a refusal; a C# app that merely *references* a native
  component is in scope.
- **Covered at:** SKILL.md front-matter `description` — "C++/WinRT and VB UWP projects are
  out of scope — refuse the request."
- **Why missed:** ambiguous wording (grey zone).
- **Improvement:** clarify that "out of scope" means the *application project itself* is
  C++/WinRT or VB; a C# app depending on a native component is handled by the new
  native-component pattern.
- **Generalizes:** prevents false refusals for the many in-scope C# UWP apps that
  ProjectReference native helpers.
