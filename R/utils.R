

## FUNCTION: download Tenerife municipalities
get_tenerife_muni <- function(sel_crs = "EPSG:25828") {
    
    ## Get Spain municipalities
    spanish_muni_sf <- gisco_get_communes(
        country = "Spain"
    ) |> 
        st_transform(sel_crs)
    
    ## Get Tenerife Island
    tenerife_sf <- gisco_get_nuts(
        country    = "Spain",
        resolution = "01",
        nuts_level = 3
    ) |> 
        filter(
            NAME_LATN == "Tenerife"
        ) |> 
        st_transform(sel_crs)
    
    ## Filter municipalities intersecting Tenerife Island
    st_filter(
        x = spanish_muni_sf,
        y = tenerife_sf
    )
    
}