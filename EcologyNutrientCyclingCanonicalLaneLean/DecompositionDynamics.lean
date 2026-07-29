import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure DecompositionPackage where
  litterPool : Type u
  decomposerCommunity : Type v
  decompositionRate : litterPool → ℚ
  nutrientRelease : litterPool → nutrientSet → ℚ
  nutrientSet : Type w
  microbialImmobilization : Prop

structure DecompositionEvidence (D : DecompositionPackage) where
  decompositionRateClosed : D.decompositionRate = 0.05
  microbialImmobilizationClosed : D.microbialImmobilization

def DecompositionClosed (D : DecompositionPackage) : Prop :=
  D.decompositionRate = 0.05 ∧ D.microbialImmobilization

theorem decomposition_closed_from_evidence (D : DecompositionPackage)
    (E : DecompositionEvidence D) : DecompositionClosed D := by
  exact And.intro E.decompositionRateClosed E.microbialImmobilizationClosed

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse