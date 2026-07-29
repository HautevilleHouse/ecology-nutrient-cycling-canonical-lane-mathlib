import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure DecompositionFluxPackage where
  litterInputRate : ℝ
  microbialEfficiency : ℝ
  humificationFraction : ℝ
  mineralisationRate : ℝ
  decompositionContinuity : Prop
  microbialControl : Prop
  degradationTermination : Prop

structure DecompositionFluxEvidence (D : DecompositionFluxPackage) where
  decompositionContinuityClosed : D.decompositionContinuity
  microbialControlClosed : D.microbialControl
  degradationTerminationClosed : D.degradationTermination

def DecompositionFluxClosed (D : DecompositionFluxPackage) : Prop :=
  D.decompositionContinuity ∧ D.microbialControl ∧ D.degradationTermination

theorem decomposition_flux_closed_from_evidence (D : DecompositionFluxPackage) (E : DecompositionFluxEvidence D) : DecompositionFluxClosed D := by
  exact And.intro E.decompositionContinuityClosed (And.intro E.microbialControlClosed E.degradationTerminationClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse