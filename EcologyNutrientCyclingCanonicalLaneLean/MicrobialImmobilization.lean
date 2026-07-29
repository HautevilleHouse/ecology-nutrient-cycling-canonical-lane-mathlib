import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure MicrobialImmobilizationPackage where
  microbialEfficiency : Prop
  nutrientStoichiometry : Prop
  cNRatioEffect : Prop
  immobilizationRate : Prop

structure MicrobialImmobilizationEvidence (M : MicrobialImmobilizationPackage) where
  microbialEfficiencyClosed : M.microbialEfficiency
  nutrientStoichiometryClosed : M.nutrientStoichiometry
  cNRatioEffectClosed : M.cNRatioEffect
  immobilizationRateClosed : M.immobilizationRate

def MicrobialImmobilizationClosed (M : MicrobialImmobilizationPackage) : Prop :=
  M.microbialEfficiency ∧ M.nutrientStoichiometry ∧ M.cNRatioEffect ∧ M.immobilizationRate

theorem microbial_immobilization_closed_from_evidence (M : MicrobialImmobilizationPackage) (E : MicrobialImmobilizationEvidence M) :
    MicrobialImmobilizationClosed M := by
  exact And.intro E.microbialEfficiencyClosed
    (And.intro E.nutrientStoichiometryClosed
      (And.intro E.cNRatioEffectClosed E.immobilizationRateClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse