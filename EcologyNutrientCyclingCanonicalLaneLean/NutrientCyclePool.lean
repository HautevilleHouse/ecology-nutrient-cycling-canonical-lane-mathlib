import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure NutrientPool where
  label : String
  quantity : ℝ
  fluxRate : ℝ
  poolType : String
  poolTypeCheck: poolType = "biomass" ∨ poolType = "soil" ∨ poolType = "atmosphere" ∨ poolType = "water"

structure NutrientCyclePackage where
  pools : List NutrientPool
  connectivity : Prop
  stoichiometry : Prop
  massBalance : Prop
  sinkIntegrity : Prop

structure NutrientCycleEvidence (N : NutrientCyclePackage) where
  connectivityClosed : N.connectivity
  stoichiometryClosed : N.stoichiometry
  massBalanceClosed : N.massBalance
  sinkIntegrityClosed : N.sinkIntegrity

def NutrientCycleClosed (N : NutrientCyclePackage) : Prop :=
  N.connectivity ∧ N.stoichiometry ∧ N.massBalance ∧ N.sinkIntegrity

theorem nutrient_cycle_closed_from_evidence (N : NutrientCyclePackage) (E : NutrientCycleEvidence N) : NutrientCycleClosed N := by
  exact And.intro E.connectivityClosed (And.intro E.stoichiometryClosed (And.intro E.massBalanceClosed E.sinkIntegrityClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse