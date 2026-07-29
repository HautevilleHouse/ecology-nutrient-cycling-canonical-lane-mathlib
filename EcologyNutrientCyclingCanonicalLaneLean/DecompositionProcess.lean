import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure DecompositionProcess where
  decompositionRate : ℝ
  temperature : ℝ
  moisture : ℝ
  litterQuality : ℝ

structure DecompositionProcessEvidence (D : DecompositionProcess) where
  rateClosed : D.decompositionRate > 0
  tempClosed : D.temperature > 273.15
  moistureClosed : D.moisture > 0 ∧ D.moisture < 1
  qualityClosed : D.litterQuality > 0 ∧ D.litterQuality < 1

def DecompositionProcessClosed (D : DecompositionProcess) : Prop :=
  D.decompositionRate > 0 ∧ D.temperature > 273.15 ∧ (D.moisture > 0 ∧ D.moisture < 1) ∧ (D.litterQuality > 0 ∧ D.litterQuality < 1)

theorem decomposition_process_closed_from_evidence (D : DecompositionProcess) (E : DecompositionProcessEvidence D) :
    DecompositionProcessClosed D := by
  exact And.intro E.rateClosed (And.intro E.tempClosed (And.intro E.moistureClosed E.qualityClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse