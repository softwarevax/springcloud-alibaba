package com.softwarevax.sca.gateway.config.route;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.RouteDefinition;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

public class GatewayUtils {

    public static List<RouteDefinition> strToRoute(String json) {
        List<RouteDefinition> routes = new ArrayList<>();
        JSONArray list = JSONArray.parseArray(json);
        for (int i = 0; i < list.size(); i++) {
            try {
                JSONObject obj = list.getJSONObject(i);
                RouteDefinition route = new RouteDefinition();
                // 1、id
                route.setId(obj.getString("id"));
                // 2、predicates
                JSONArray predicates = obj.getJSONArray("predicates");
                if(predicates != null) {
                    List<PredicateDefinition> predicateDefinitions = new ArrayList<>();
                    for (int j = 0; j < predicates.size(); j++) {
                        String predicate = predicates.getString(j);
                        predicateDefinitions.add(new PredicateDefinition(predicate));
                    }
                    route.setPredicates(predicateDefinitions);
                }
                // 3、uri
                route.setUri(new URI(obj.getString("uri")));
                // 4、filters
                JSONArray filters = obj.getJSONArray("filters");
                if(filters != null) {
                    List<FilterDefinition> filterDefinitions = new ArrayList<>();
                    for (int j = 0; j < filters.size(); j++) {
                        String filter = filters.getString(j);
                        filterDefinitions.add(new FilterDefinition(filter));
                    }
                    route.setFilters(filterDefinitions);
                }
                // 5、order
                int order = obj.getIntValue("order");
                route.setOrder(order);
                // 6、metadata
                JSONObject metadata = obj.getJSONObject("metadata");
                if(metadata != null) {
                    route.setMetadata(metadata);
                }
                routes.add(route);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return routes;
    }
}
