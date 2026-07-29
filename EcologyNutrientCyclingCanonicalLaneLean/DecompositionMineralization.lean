import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure DecompositionRate where
  litterInput : ℝ
  microbialBiomass : ℝ
  temperatureFactor : ℝ
  moistureFactor : ℝ
  decompositionCoefficient : ℝ
  rateLawsDefined : Prop
  parameterValuesPos : Prop

structure MineralizationFlux where
  nitrogenMineralization : ℝ
  phosphorusMineralization : ℝ
  carbonRelease : ℝ
  fluxesConsistent : Prop

structure DecompositionMineralizationPackage where
  decomposition : DecompositionRate
  mineralization : MineralizationFlux
  couplingConstraint : Prop
  couplingConstraintTerm : couplingConstraint

structure DecompositionMineralizationEvidence
    (D : DecompositionMineralizationPackage) where
  decompositionRateLawsClosed : D.decomposition.rateLawsDefined
  decompositionParamsClosed : D.decomposition.parameterValuesPos
  mineralizationFluxesConsistentClosed : D.mineralization.fluxesConsistent
  couplingConstraintClosed : D.couplingConstraint

def DecompositionMineralizationClosed (D : DecompositionMineralizationPackage) : Prop :=
  D.decomposition.rateLawsDefined ∧
  D.decomposition.parameterValuesPos ∧
  D.mineralization.fluxesConsistent ∧
  D.couplingConstraint

theorem decomposition_mineralization_closed_from_evidence
    (D : DecompositionMineralizationPackage)
    (E : DecompositionMineralizationEvidence D) :
    DecompositionMineralizationClosed D := by
  exact And.intro E.decompositionRateLawsClosed
    (And.intro E.decompositionParamsClosed
      (And.intro E.mineralizationFluxesConsistentClosed E.couplingConstraintClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse